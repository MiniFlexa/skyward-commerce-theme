
{* 
  * PrestaShop Product Detail Template for Skyward Aviation Theme
  * 
  * This template can be used as a reference for creating PrestaShop product detail templates
  * 
  * Variables available:
  * {$product} - Product data
  * {$product.images} - Product images
  * {$product.attributes} - Product attributes/variants
*}

<section class="py-16">
  <div class="container mx-auto px-4">
    <div class="grid grid-cols-1 md:grid-cols-2 gap-12">
      {* Left column: Product images *}
      <div>
        <div class="mb-4 product-cover">
          <img 
            src="{$product.cover.large.url}" 
            alt="{$product.cover.legend}" 
            class="w-full h-auto rounded-lg shadow-md"
            id="product-main-image"
          />
        </div>
        
        {if $product.images|count > 1}
          <div class="grid grid-cols-4 gap-2 product-thumbnails">
            {foreach from=$product.images item=image}
              <div class="cursor-pointer thumbnail-item{if $image.id_image == $product.cover.id_image} active{/if}">
                <img 
                  src="{$image.medium.url}" 
                  alt="{$image.legend}" 
                  class="w-full h-auto rounded-md hover:opacity-80 transition-opacity"
                  data-image-large-src="{$image.large.url}"
                />
              </div>
            {/foreach}
          </div>
        {/if}
      </div>
      
      {* Right column: Product info *}
      <div>
        {* Breadcrumbs *}
        <nav class="text-sm mb-6">
          <ol class="flex flex-wrap items-center space-x-2">
            <li>
              <a href="{$urls.base_url}" class="text-navy hover:text-accent transition-colors">
                {l s='Home' d='Shop.Theme.Global'}
              </a>
            </li>
            <li class="text-muted-foreground">/</li>
            {foreach from=$breadcrumb.links item=path name=breadcrumb}
              <li>
                <a href="{$path.url}" class="text-navy hover:text-accent transition-colors">
                  {$path.title}
                </a>
              </li>
              {if !$smarty.foreach.breadcrumb.last}
                <li class="text-muted-foreground">/</li>
              {/if}
            {/foreach}
          </ol>
        </nav>
        
        {* Product Name *}
        <h1 class="text-3xl font-bold mb-4">{$product.name}</h1>
        
        {* Reference and condition *}
        <div class="flex flex-wrap items-center mb-4 space-x-4">
          {if $product.reference}
            <span class="text-sm text-muted-foreground">
              {l s='Reference' d='Shop.Theme.Catalog'}: {$product.reference}
            </span>
          {/if}
          
          {if $product.condition}
            <span class="text-sm text-muted-foreground">
              {l s='Condition' d='Shop.Theme.Catalog'}: {$product.condition.label}
            </span>
          {/if}
        </div>
        
        {* Product Price *}
        <div class="mb-6">
          {if $product.has_discount}
            <div class="flex items-center space-x-3">
              <span class="text-2xl font-bold text-accent">{$product.price}</span>
              <span class="text-lg line-through text-muted-foreground">{$product.regular_price}</span>
              <span class="bg-accent text-white px-2 py-1 rounded text-sm font-medium">
                {l s='Save' d='Shop.Theme.Catalog'} {$product.discount_percentage}
              </span>
            </div>
          {else}
            <span class="text-2xl font-bold">{$product.price}</span>
          {/if}
          
          {* Tax information *}
          <div class="text-sm text-muted-foreground mt-1">
            {$product.tax_label}
          </div>
        </div>
        
        {* Short Description *}
        {if $product.description_short}
          <div class="mb-6 prose prose-sm max-w-none">
            {$product.description_short nofilter}
          </div>
        {/if}
        
        {* Add to cart form *}
        {block name='product_buy'}
          <form action="{$urls.pages.cart}" method="post" id="add-to-cart-form">
            <input type="hidden" name="token" value="{$static_token}">
            <input type="hidden" name="id_product" value="{$product.id}">
            
            {* Variants/Attributes *}
            {block name='product_variants'}
              {if $product.main_variants|count > 0}
                <div class="mb-6">
                  {foreach from=$product.main_variants item=attribute_group}
                    <div class="mb-4">
                      <label class="block text-sm font-medium mb-2">
                        {$attribute_group.name}: <span class="text-navy" id="current-{$attribute_group.id}">{$attribute_group.selected}</span>
                      </label>
                      
                      <div class="flex flex-wrap gap-2">
                        {foreach from=$attribute_group.attributes item=attribute}
                          <div 
                            class="attribute-item cursor-pointer px-3 py-1 rounded-full border {if $attribute.selected}bg-navy text-white border-navy{else}border-gray-300 hover:border-navy{/if}" 
                            data-attribute-group="{$attribute_group.id}"
                            data-attribute="{$attribute.name}"
                            data-attribute-value="{$attribute.id}"
                          >
                            {$attribute.name}
                          </div>
                        {/foreach}
                      </div>
                    </div>
                  {/foreach}
                </div>
              {/if}
            {/block}
            
            {* Quantity *}
            <div class="mb-6">
              <label for="quantity_wanted" class="block text-sm font-medium mb-2">
                {l s='Quantity' d='Shop.Theme.Catalog'}
              </label>
              <div class="flex items-center space-x-3">
                <div class="flex items-center border border-gray-300 rounded-md overflow-hidden">
                  <button type="button" class="quantity-down px-3 py-2 bg-gray-100 hover:bg-gray-200">-</button>
                  <input
                    type="number"
                    name="qty"
                    id="quantity_wanted"
                    value="{$product.quantity_wanted}"
                    class="border-0 text-center w-12 focus:outline-none"
                    min="{$product.minimal_quantity}"
                  />
                  <button type="button" class="quantity-up px-3 py-2 bg-gray-100 hover:bg-gray-200">+</button>
                </div>
                
                <button 
                  type="submit"
                  class="btn-primary flex items-center space-x-2 px-8 py-3"
                  {if $product.quantity < 1}disabled{/if}
                >
                  <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                    <circle cx="9" cy="21" r="1"></circle>
                    <circle cx="20" cy="21" r="1"></circle>
                    <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path>
                  </svg>
                  <span>
                    {if $product.quantity < 1}
                      {l s='Out of stock' d='Shop.Theme.Actions'}
                    {else}
                      {l s='Add to cart' d='Shop.Theme.Actions'}
                    {/if}
                  </span>
                </button>
              </div>
            </div>
          </form>
        {/block}
        
        {* Product Meta *}
        <div class="space-y-3 pt-6 border-t border-gray-200">
          {* Availability *}
          <div class="flex items-center">
            <span class="text-sm font-medium w-24">{l s='Availability:' d='Shop.Theme.Catalog'}</span>
            <span class="{if $product.quantity > 0}text-green-600{else}text-red-600{/if}">
              {if $product.quantity > 0}
                {l s='In Stock' d='Shop.Theme.Catalog'}
              {else}
                {l s='Out of Stock' d='Shop.Theme.Catalog'}
              {/if}
            </span>
          </div>
          
          {* Delivery *}
          <div class="flex items-center">
            <span class="text-sm font-medium w-24">{l s='Delivery:' d='Shop.Theme.Catalog'}</span>
            <span>{l s='2-4 business days' d='Shop.Theme.Catalog'}</span>
          </div>
          
          {* Social sharing *}
          {block name='product_social_sharing'}
            <div class="flex items-center mt-6 pt-4 border-t border-gray-200">
              <span class="text-sm font-medium mr-4">{l s='Share:' d='Shop.Theme.Catalog'}</span>
              <div class="flex space-x-3">
                <a href="#" class="text-navy hover:text-accent transition-colors">
                  <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 24 24">
                    <path d="M18.77 7.46H14.5v-1.9c0-.9.6-1.1 1-1.1h3V.5h-4.33C10.24.5 9.5 3.44 9.5 5.32v2.15h-3v4h3v12h5v-12h3.85l.42-4z"/>
                  </svg>
                </a>
                <a href="#" class="text-navy hover:text-accent transition-colors">
                  <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 24 24">
                    <path d="M23.953 4.57a10 10 0 01-2.825.775 4.958 4.958 0 002.163-2.723c-.951.555-2.005.959-3.127 1.184a4.92 4.92 0 00-8.384 4.482C7.69 8.095 4.067 6.13 1.64 3.162a4.822 4.822 0 00-.666 2.475c0 1.71.87 3.213 2.188 4.096a4.904 4.904 0 01-2.228-.616v.06a4.923 4.923 0 003.946 4.827 4.996 4.996 0 01-2.212.085 4.936 4.936 0 004.604 3.417 9.867 9.867 0 01-6.102 2.105c-.39 0-.779-.023-1.17-.067a13.995 13.995 0 007.557 2.209c9.053 0 13.998-7.496 13.998-13.985 0-.21 0-.42-.015-.63A9.935 9.935 0 0024 4.59z"/>
                  </svg>
                </a>
                <a href="#" class="text-navy hover:text-accent transition-colors">
                  <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 24 24">
                    <path d="M20.447 20.452h-3.554v-5.569c0-1.328-.027-3.037-1.852-3.037-1.853 0-2.136 1.445-2.136 2.939v5.667H9.351V9h3.414v1.561h.046c.477-.9 1.637-1.85 3.37-1.85 3.601 0 4.267 2.37 4.267 5.455v6.286zM5.337 7.433c-1.144 0-2.063-.926-2.063-2.065 0-1.138.92-2.063 2.063-2.063 1.14 0 2.064.925 2.064 2.063 0 1.139-.925 2.065-2.064 2.065zm1.782 13.019H3.555V9h3.564v11.452zM22.225 0H1.771C.792 0 0 .774 0 1.729v20.542C0 23.227.792 24 1.771 24h20.451C23.2 24 24 23.227 24 22.271V1.729C24 .774 23.2 0 22.222 0h.003z"/>
                  </svg>
                </a>
                <a href="#" class="text-navy hover:text-accent transition-colors">
                  <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="currentColor" viewBox="0 0 24 24">
                    <path d="M12 0C8.74 0 8.333.015 7.053.072 5.775.132 4.905.333 4.14.63c-.789.306-1.459.717-2.126 1.384S.935 3.35.63 4.14C.333 4.905.131 5.775.072 7.053.012 8.333 0 8.74 0 12s.015 3.667.072 4.947c.06 1.277.261 2.148.558 2.913.306.788.717 1.459 1.384 2.126.667.666 1.336 1.079 2.126 1.384.766.296 1.636.499 2.913.558C8.333 23.988 8.74 24 12 24s3.667-.015 4.947-.072c1.277-.06 2.148-.262 2.913-.558.788-.306 1.459-.718 2.126-1.384.666-.667 1.079-1.335 1.384-2.126.296-.765.499-1.636.558-2.913.06-1.28.072-1.687.072-4.947s-.015-3.667-.072-4.947c-.06-1.277-.262-2.149-.558-2.913-.306-.789-.718-1.459-1.384-2.126C21.319 1.347 20.651.935 19.86.63c-.765-.297-1.636-.499-2.913-.558C15.667.012 15.26 0 12 0zm0 2.16c3.203 0 3.585.016 4.85.071 1.17.055 1.805.249 2.227.415.562.217.96.477 1.382.896.419.42.679.819.896 1.381.164.422.36 1.057.413 2.227.057 1.266.07 1.646.07 4.85s-.015 3.585-.074 4.85c-.061 1.17-.256 1.805-.421 2.227-.224.562-.479.96-.899 1.382-.419.419-.824.679-1.38.896-.42.164-1.065.36-2.235.413-1.274.057-1.649.07-4.859.07-3.211 0-3.586-.015-4.859-.074-1.171-.061-1.816-.256-2.236-.421-.569-.224-.96-.479-1.379-.899-.421-.419-.69-.824-.9-1.38-.165-.42-.359-1.065-.42-2.235-.045-1.26-.061-1.649-.061-4.844 0-3.196.016-3.586.061-4.861.061-1.17.255-1.814.42-2.234.21-.57.479-.96.9-1.381.419-.419.81-.689 1.379-.898.42-.166 1.051-.361 2.221-.421 1.275-.045 1.65-.06 4.859-.06l.045.03zm0 3.678c-3.405 0-6.162 2.76-6.162 6.162 0 3.405 2.76 6.162 6.162 6.162 3.405 0 6.162-2.76 6.162-6.162 0-3.405-2.76-6.162-6.162-6.162zM12 16c-2.21 0-4-1.79-4-4s1.79-4 4-4 4 1.79 4 4-1.79 4-4 4zm7.846-10.405c0 .795-.646 1.44-1.44 1.44-.795 0-1.44-.646-1.44-1.44 0-.794.646-1.439 1.44-1.439.793-.001 1.44.645 1.44 1.439z"/>
                  </svg>
                </a>
              </div>
            </div>
          {/block}
        </div>
      </div>
    </div>
    
    {* Product Details Tabs *}
    <div class="mt-16">
      <div class="border-b border-gray-200">
        <div class="flex overflow-x-auto">
          <button 
            class="px-6 py-3 border-b-2 border-navy text-navy font-medium whitespace-nowrap"
            id="tab-description"
          >
            {l s='Description' d='Shop.Theme.Catalog'}
          </button>
          <button 
            class="px-6 py-3 border-b-2 border-transparent hover:text-navy whitespace-nowrap"
            id="tab-details"
          >
            {l s='Product Details' d='Shop.Theme.Catalog'}
          </button>
          <button 
            class="px-6 py-3 border-b-2 border-transparent hover:text-navy whitespace-nowrap"
            id="tab-reviews"
          >
            {l s='Reviews' d='Shop.Theme.Catalog'}
          </button>
        </div>
      </div>
      
      <div class="mt-8 tab-content" id="tab-description-content">
        <div class="prose max-w-none">
          {$product.description nofilter}
        </div>
      </div>
      
      <div class="mt-8 hidden tab-content" id="tab-details-content">
        <div class="grid grid-cols-1 md:grid-cols-2 gap-8">
          {if $product.features}
            <div>
              <h3 class="text-lg font-semibold mb-4">{l s='Features' d='Shop.Theme.Catalog'}</h3>
              <ul class="space-y-2">
                {foreach from=$product.features item=feature}
                  <li class="flex">
                    <span class="font-medium w-32">{$feature.name}:</span>
                    <span>{$feature.value}</span>
                  </li>
                {/foreach}
              </ul>
            </div>
          {/if}
          
          <div>
            <h3 class="text-lg font-semibold mb-4">{l s='Specifications' d='Shop.Theme.Catalog'}</h3>
            <ul class="space-y-2">
              {if $product.reference}
                <li class="flex">
                  <span class="font-medium w-32">{l s='Reference' d='Shop.Theme.Catalog'}:</span>
                  <span>{$product.reference}</span>
                </li>
              {/if}
              {if $product.ean13}
                <li class="flex">
                  <span class="font-medium w-32">EAN-13:</span>
                  <span>{$product.ean13}</span>
                </li>
              {/if}
              {if $product.isbn}
                <li class="flex">
                  <span class="font-medium w-32">ISBN:</span>
                  <span>{$product.isbn}</span>
                </li>
              {/if}
              {if $product.upc}
                <li class="flex">
                  <span class="font-medium w-32">UPC:</span>
                  <span>{$product.upc}</span>
                </li>
              {/if}
            </ul>
          </div>
        </div>
      </div>
      
      <div class="mt-8 hidden tab-content" id="tab-reviews-content">
        {block name='product_reviews'}
          {include file='module:productcomments/views/templates/hook/product-comments.tpl'}
        {/block}
      </div>
    </div>
  </div>
</section>

{* Simple JavaScript for tabs toggle *}
<script type="text/javascript">
  document.addEventListener('DOMContentLoaded', function() {
    // Tab switching
    const tabButtons = document.querySelectorAll('[id^="tab-"]:not([id$="-content"])');
    const tabContents = document.querySelectorAll('.tab-content');
    
    tabButtons.forEach(button => {
      button.addEventListener('click', function() {
        // Reset all tabs
        tabButtons.forEach(btn => {
          btn.classList.remove('border-navy', 'text-navy');
          btn.classList.add('border-transparent');
        });
        
        // Hide all content
        tabContents.forEach(content => {
          content.classList.add('hidden');
        });
        
        // Activate clicked tab
        this.classList.remove('border-transparent');
        this.classList.add('border-navy', 'text-navy');
        
        // Show corresponding content
        const contentId = this.id + '-content';
        document.getElementById(contentId).classList.remove('hidden');
      });
    });
    
    // Thumbnail image switching
    const thumbnails = document.querySelectorAll('.thumbnail-item img');
    const mainImage = document.getElementById('product-main-image');
    
    if (thumbnails.length > 0 && mainImage) {
      thumbnails.forEach(thumb => {
        thumb.addEventListener('click', function() {
          const largeUrl = this.getAttribute('data-image-large-src');
          mainImage.src = largeUrl;
          
          // Update active state
          document.querySelectorAll('.thumbnail-item').forEach(item => {
            item.classList.remove('active');
          });
          this.parentElement.classList.add('active');
        });
      });
    }
    
    // Quantity buttons
    const qtyInput = document.getElementById('quantity_wanted');
    const qtyDown = document.querySelector('.quantity-down');
    const qtyUp = document.querySelector('.quantity-up');
    
    if (qtyInput && qtyDown && qtyUp) {
      qtyDown.addEventListener('click', function() {
        const currentVal = parseInt(qtyInput.value);
        const minVal = parseInt(qtyInput.getAttribute('min') || '1');
        if (currentVal > minVal) {
          qtyInput.value = currentVal - 1;
        }
      });
      
      qtyUp.addEventListener('click', function() {
        const currentVal = parseInt(qtyInput.value);
        qtyInput.value = currentVal + 1;
      });
    }
    
    // Attribute selection
    const attributeItems = document.querySelectorAll('.attribute-item');
    
    attributeItems.forEach(item => {
      item.addEventListener('click', function() {
        const groupId = this.getAttribute('data-attribute-group');
        const attributeValue = this.getAttribute('data-attribute-value');
        const attributeName = this.getAttribute('data-attribute');
        
        // Update UI
        document.querySelectorAll(`.attribute-item[data-attribute-group="${groupId}"]`).forEach(el => {
          el.classList.remove('bg-navy', 'text-white', 'border-navy');
          el.classList.add('border-gray-300');
        });
        
        this.classList.add('bg-navy', 'text-white', 'border-navy');
        this.classList.remove('border-gray-300');
        
        // Update displayed attribute name
        document.getElementById(`current-${groupId}`).textContent = attributeName;
        
        // This is where you'd trigger the product combination change
        // In a real implementation, this would update product price, images, etc.
      });
    });
  });
</script>
