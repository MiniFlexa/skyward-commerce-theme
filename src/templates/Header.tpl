
{* 
  * PrestaShop Header Template for Skyward Aviation Theme
  * 
  * This template can be used as a reference for creating PrestaShop header templates
  * 
  * Variables available:
  * {$shop.name} - Store name
  * {$cart.products_count} - Number of products in cart
  * {$customer.is_logged} - Whether customer is logged in
  * {$link} - URL utility object
  * {$categories} - Available categories
*}

<nav class="bg-white shadow-sm sticky top-0 z-50">
  <div class="container mx-auto px-4 py-4">
    <div class="flex items-center justify-between">
      <div class="flex items-center space-x-8">
        <a href="{$link->getPageLink('index')}" class="flex items-center space-x-2">
          <span class="text-2xl font-bold text-navy-dark">{$shop.name}</span>
        </a>
        
        <div class="hidden md:flex space-x-6">
          {foreach from=$categories item=category}
            <a href="{$link->getCategoryLink($category.id_category)}" class="navbar-link">{$category.name}</a>
          {/foreach}
        </div>
      </div>
      
      <div class="hidden md:flex items-center space-x-4">
        <div class="relative">
          <form method="get" action="{$link->getPageLink('search')}">
            <input 
              type="text"
              name="s"
              placeholder="{l s='Search products...' d='Shop.Theme.Catalog'}"
              class="aviation-input pl-10 w-64"
            />
            <button type="submit" class="absolute left-3 top-2.5 h-4 w-4 text-gray-400">
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <circle cx="11" cy="11" r="8"></circle>
                <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
              </svg>
            </button>
          </form>
        </div>
        
        <a href="{$link->getPageLink('my-account')}" class="btn-ghost">
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
            <circle cx="12" cy="7" r="4"></circle>
          </svg>
        </a>
        
        <a href="{$link->getPageLink('cart')}" class="btn-ghost relative">
          <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <circle cx="9" cy="21" r="1"></circle>
            <circle cx="20" cy="21" r="1"></circle>
            <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path>
          </svg>
          {if $cart.products_count > 0}
            <span class="absolute -top-1 -right-1 bg-accent text-white text-xs rounded-full h-5 w-5 flex items-center justify-center">
              {$cart.products_count}
            </span>
          {/if}
        </a>
      </div>
      
      {* Mobile menu toggle *}
      <div class="md:hidden">
        <button aria-label="Toggle Menu" id="mobile-menu-toggle" class="btn-ghost">
          <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
            <line x1="3" y1="12" x2="21" y2="12"></line>
            <line x1="3" y1="6" x2="21" y2="6"></line>
            <line x1="3" y1="18" x2="21" y2="18"></line>
          </svg>
        </button>
      </div>
    </div>
    
    {* Mobile menu - Initially hidden *}
    <div id="mobile-menu" class="hidden md:hidden pt-4 pb-2 border-t mt-4">
      <div class="flex flex-col space-y-4">
        {foreach from=$categories item=category}
          <a href="{$link->getCategoryLink($category.id_category)}" class="navbar-link block py-2">{$category.name}</a>
        {/foreach}
        
        <div class="relative mt-2">
          <form method="get" action="{$link->getPageLink('search')}">
            <input 
              type="text"
              name="s"
              placeholder="{l s='Search products...' d='Shop.Theme.Catalog'}"
              class="aviation-input pl-10 w-full"
            />
            <button type="submit" class="absolute left-3 top-2.5 h-4 w-4 text-gray-400">
              <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <circle cx="11" cy="11" r="8"></circle>
                <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
              </svg>
            </button>
          </form>
        </div>
        
        <div class="flex space-x-4 py-2">
          <a href="{$link->getPageLink('my-account')}" class="btn-outline flex items-center space-x-2 w-1/2">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path>
              <circle cx="12" cy="7" r="4"></circle>
            </svg>
            <span>{l s='Account' d='Shop.Theme.Customeraccount'}</span>
          </a>
          
          <a href="{$link->getPageLink('cart')}" class="btn-outline flex items-center space-x-2 w-1/2 relative">
            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
              <circle cx="9" cy="21" r="1"></circle>
              <circle cx="20" cy="21" r="1"></circle>
              <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path>
            </svg>
            <span>{l s='Cart' d='Shop.Theme.Checkout'}</span>
            {if $cart.products_count > 0}
              <span class="absolute -top-1 -right-1 bg-accent text-white text-xs rounded-full h-5 w-5 flex items-center justify-center">
                {$cart.products_count}
              </span>
            {/if}
          </a>
        </div>
      </div>
    </div>
  </div>
</nav>

{* Simple JavaScript for mobile menu toggle *}
<script type="text/javascript">
  document.addEventListener('DOMContentLoaded', function() {
    const mobileMenuToggle = document.getElementById('mobile-menu-toggle');
    const mobileMenu = document.getElementById('mobile-menu');
    
    if (mobileMenuToggle && mobileMenu) {
      mobileMenuToggle.addEventListener('click', function() {
        if (mobileMenu.classList.contains('hidden')) {
          mobileMenu.classList.remove('hidden');
        } else {
          mobileMenu.classList.add('hidden');
        }
      });
    }
  });
</script>
