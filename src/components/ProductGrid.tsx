
import React from 'react';
import { Link } from 'react-router-dom';
import { 
  Pagination, 
  PaginationContent, 
  PaginationEllipsis, 
  PaginationItem, 
  PaginationLink, 
  PaginationNext, 
  PaginationPrevious 
} from '@/components/ui/pagination';

// Define the Product type
interface Product {
  id: string;
  name: string;
  price: string;
  regularPrice?: string;
  hasDiscount: boolean;
  category: string;
  categoryId: string;
  image: string;
  isNew: boolean;
  isSale: boolean;
}

interface ProductGridProps {
  categoryId?: string;
}

const ProductGrid: React.FC<ProductGridProps> = ({ categoryId }) => {
  // Mock products data
  // In a real application, this would come from an API based on the categoryId
  const allProducts: Product[] = [
    {
      id: "product-1",
      name: "Classic Aviator Sunglasses",
      price: "$129.99",
      regularPrice: "$149.99",
      hasDiscount: true,
      category: "Aviator Glasses",
      categoryId: "aviator-glasses",
      image: "/placeholder.svg",
      isNew: true,
      isSale: true
    },
    {
      id: "product-2",
      name: "Pilot's Navigation Watch",
      price: "$249.99",
      hasDiscount: false,
      category: "Pilot Watches",
      categoryId: "pilot-watches",
      image: "/placeholder.svg",
      isNew: false,
      isSale: false
    },
    {
      id: "product-3",
      name: "Leather Flight Jacket",
      price: "$399.99",
      regularPrice: "$459.99",
      hasDiscount: true,
      category: "Flight Gear",
      categoryId: "flight-gear",
      image: "/placeholder.svg",
      isNew: false,
      isSale: true
    },
    {
      id: "product-4",
      name: "Vintage Aircraft Keychain",
      price: "$24.99",
      hasDiscount: false,
      category: "Accessories",
      categoryId: "accessories",
      image: "/placeholder.svg",
      isNew: true,
      isSale: false
    },
    {
      id: "product-5",
      name: "Polarized Aviator Glasses",
      price: "$159.99",
      hasDiscount: false,
      category: "Aviator Glasses",
      categoryId: "aviator-glasses",
      image: "/placeholder.svg",
      isNew: false,
      isSale: false
    },
    {
      id: "product-6",
      name: "GMT Pilot Watch",
      price: "$329.99",
      regularPrice: "$379.99",
      hasDiscount: true,
      category: "Pilot Watches",
      categoryId: "pilot-watches",
      image: "/placeholder.svg",
      isNew: true,
      isSale: true
    },
    {
      id: "product-7",
      name: "Aviation Scarf",
      price: "$49.99",
      hasDiscount: false,
      category: "Accessories",
      categoryId: "accessories",
      image: "/placeholder.svg",
      isNew: false,
      isSale: false
    },
    {
      id: "product-8",
      name: "Flight Helmet Bag",
      price: "$89.99",
      hasDiscount: false,
      category: "Flight Gear",
      categoryId: "flight-gear",
      image: "/placeholder.svg",
      isNew: true,
      isSale: false
    }
  ];

  // Filter products by category if categoryId is provided
  const products = categoryId 
    ? allProducts.filter(product => product.categoryId === categoryId)
    : allProducts;

  return (
    <>
      <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-8">
        {products.map((product) => (
          <div key={product.id} className="product-card rounded-lg overflow-hidden border border-gray-200 bg-white shadow-sm hover:shadow-md transition-shadow">
            <div className="relative">
              <Link to={`/product/${product.id}`}>
                <img 
                  src={product.image} 
                  alt={product.name} 
                  className="w-full h-64 object-cover"
                />
              </Link>
              
              {product.isNew && (
                <span className="absolute top-3 left-3 bg-sky-500 text-white text-xs font-medium px-2.5 py-1 rounded">New</span>
              )}
              {product.isSale && (
                <span className="absolute top-3 right-3 bg-navy-dark text-white text-xs font-medium px-2.5 py-1 rounded">Sale</span>
              )}
            </div>
            
            <div className="p-4">
              <div className="text-sm text-muted-foreground mb-1">
                {product.category}
              </div>
              
              <h3 className="font-semibold text-lg mb-2">
                <Link to={`/product/${product.id}`} className="hover:text-navy transition-colors">
                  {product.name}
                </Link>
              </h3>
              
              <div className="flex items-center justify-between">
                <div>
                  {product.hasDiscount ? (
                    <>
                      <span className="text-lg font-bold text-sky-600">{product.price}</span>
                      <span className="text-sm line-through text-muted-foreground ml-2">{product.regularPrice}</span>
                    </>
                  ) : (
                    <span className="text-lg font-bold">{product.price}</span>
                  )}
                </div>
                
                <button className="bg-navy-dark hover:bg-navy text-white px-3 py-1 text-sm rounded flex items-center transition-colors">
                  <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" strokeWidth="2" strokeLinecap="round" strokeLinejoin="round" className="mr-1">
                    <circle cx="9" cy="21" r="1"></circle>
                    <circle cx="20" cy="21" r="1"></circle>
                    <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path>
                  </svg>
                  Add to cart
                </button>
              </div>
            </div>
          </div>
        ))}
      </div>

      {/* Pagination */}
      <div className="mt-12">
        <Pagination>
          <PaginationContent>
            <PaginationItem>
              <PaginationPrevious href="#" />
            </PaginationItem>
            <PaginationItem>
              <PaginationLink href="#" isActive>1</PaginationLink>
            </PaginationItem>
            <PaginationItem>
              <PaginationLink href="#">2</PaginationLink>
            </PaginationItem>
            <PaginationItem>
              <PaginationLink href="#">3</PaginationLink>
            </PaginationItem>
            <PaginationItem>
              <PaginationEllipsis />
            </PaginationItem>
            <PaginationItem>
              <PaginationNext href="#" />
            </PaginationItem>
          </PaginationContent>
        </Pagination>
      </div>
    </>
  );
};

export default ProductGrid;
