
import React from 'react';
import { Card, CardContent } from '@/components/ui/card';
import { Badge } from '@/components/ui/badge';
import { Button } from '@/components/ui/button';
import { ShoppingCart } from 'lucide-react';

interface Product {
  id: number;
  name: string;
  category: string;
  price: number;
  image: string;
  isBestseller?: boolean;
  isNew?: boolean;
}

const featuredProducts: Product[] = [
  {
    id: 1,
    name: "Classic Aviator Gold",
    category: "Aviator Glasses",
    price: 129.99,
    image: "/placeholder.svg",
    isBestseller: true
  },
  {
    id: 2,
    name: "Pilot Silver Frame",
    category: "Aviator Glasses",
    price: 149.99,
    image: "/placeholder.svg",
    isNew: true
  },
  {
    id: 3,
    name: "Navigator Titanium",
    category: "Aviator Glasses",
    price: 199.99,
    image: "/placeholder.svg"
  },
  {
    id: 4,
    name: "Vintage Aviator Brown",
    category: "Aviator Glasses",
    price: 139.99,
    image: "/placeholder.svg"
  }
];

const ProductCard = ({ product }: { product: Product }) => {
  return (
    <Card className="product-card">
      <div className="relative">
        <img 
          src={product.image} 
          alt={product.name}
          className="w-full h-64 object-cover"
        />
        {product.isBestseller && (
          <Badge className="absolute top-3 left-3 bg-navy text-white">Bestseller</Badge>
        )}
        {product.isNew && (
          <Badge className="absolute top-3 left-3 bg-accent text-white">New</Badge>
        )}
      </div>
      <CardContent className="p-4">
        <div className="text-sm text-muted-foreground mb-1">{product.category}</div>
        <h3 className="font-semibold text-lg mb-2">{product.name}</h3>
        <div className="flex items-center justify-between">
          <span className="text-lg font-bold">${product.price.toFixed(2)}</span>
          <Button size="sm" className="h-8 px-3">
            <ShoppingCart className="h-4 w-4 mr-2" />
            Add to cart
          </Button>
        </div>
      </CardContent>
    </Card>
  );
};

const FeaturedProducts = () => {
  return (
    <section className="py-16 bg-cloud">
      <div className="container mx-auto px-4">
        <div className="text-center mb-12">
          <h2 className="text-3xl font-bold mb-4">Featured Products</h2>
          <p className="text-muted-foreground max-w-2xl mx-auto">
            Discover our exclusive collection of aviation-inspired eyewear, crafted with precision and style.
          </p>
        </div>
        
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-8">
          {featuredProducts.map(product => (
            <ProductCard key={product.id} product={product} />
          ))}
        </div>
        
        <div className="mt-12 text-center">
          <Button className="btn-primary">View All Products</Button>
        </div>
      </div>
    </section>
  );
};

export default FeaturedProducts;
