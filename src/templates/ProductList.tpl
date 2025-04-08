
{* 
  * PrestaShop Product List Template for Skyward Aviation Theme
  * 
  * This template can be used as a reference for creating PrestaShop product list templates
  * 
  * Variables available:
  * {$products} - List of products
  * {$category} - Current category
  * {$pagination} - Pagination info
*}

<section class="py-16 bg-cloud">
  <div class="container mx-auto px-4">
    {if isset($category) && $category}
      <div class="text-center mb-12">
        <h1 class="text-3xl font-bold mb-4">{$category.name}</h1>
        {if $category.description}
          <div class="text-muted-foreground max-w-2xl mx-auto">
            {$category.description nofilter}
          </div>
        {/if}
      </div>
    {else}
      <div class="text-center mb-12">
        <h1 class="text-3xl font-bold mb-4">{l s='Products' d='Shop.Theme.Catalog'}</h1>
      </div>
    {/if}
    
    {* Filters and sorting - simplified *}
    <div class="flex flex-col md:flex-row justify-between items-start mb-8">
      <div class="mb-4 md:mb-0">
        {block name='sort_by'}
          {include file='catalog/_partials/sort-orders.tpl' sort_orders=$listing.sort_orders}
        {/block}
      </div>
      
      <div>
        {block name='facets'}
          {if $facets|count}
            {include file='catalog/_partials/facets.tpl' facets=$facets}
          {/if}
        {/block}
      </div>
    </div>
    
    {* Product grid *}
    <div class="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-8">
      {foreach from=$products item=product}
        <div class="product-card">
          <div class="relative">
            <a href="{$product.url}">
              <img 
                src="{$product.cover.medium.url}" 
                alt="{$product.cover.legend}" 
                class="w-full h-64 object-cover"
              />
            </a>
            
            {if $product.flags}
              {foreach from=$product.flags item=flag}
                {if $flag.type == 'new'}
                  <span class="badge badge-accent absolute top-3 left-3">{l s='New' d='Shop.Theme.Catalog'}</span>
                {/if}
                {if $flag.type == 'on-sale' || $flag.type == 'discount'}
                  <span class="badge badge-navy absolute top-3 left-3">{l s='Sale' d='Shop.Theme.Catalog'}</span>
                {/if}
              {/foreach}
            {/if}
          </div>
          
          <div class="p-4">
            <div class="text-sm text-muted-foreground mb-1">
              {$product.category_name}
            </div>
            
            <h3 class="font-semibold text-lg mb-2">
              <a href="{$product.url}">{$product.name}</a>
            </h3>
            
            <div class="flex items-center justify-between">
              <div>
                {if $product.has_discount}
                  <span class="text-lg font-bold text-accent">{$product.price}</span>
                  <span class="text-sm line-through text-muted-foreground ml-2">{$product.regular_price}</span>
                {else}
                  <span class="text-lg font-bold">{$product.price}</span>
                {/if}
              </div>
              
              <form action="{$urls.pages.cart}" method="post">
                <input type="hidden" name="id_product" value="{$product.id_product}">
                <input type="hidden" name="qty" value="1">
                <button type="submit" class="btn-primary btn-sm h-8 px-3 flex items-center">
                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="mr-2">
                    <circle cx="9" cy="21" r="1"></circle>
                    <circle cx="20" cy="21" r="1"></circle>
                    <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path>
                  </svg>
                  {l s='Add to cart' d='Shop.Theme.Actions'}
                </button>
              </form>
            </div>
          </div>
        </div>
      {/foreach}
    </div>
    
    {* Pagination *}
    {block name='pagination'}
      {include file='_partials/pagination.tpl' pagination=$pagination}
    {/block}
  </div>
</section>
