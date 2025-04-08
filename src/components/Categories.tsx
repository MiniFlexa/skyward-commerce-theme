
import React from 'react';
import { Link } from 'react-router-dom';

interface Category {
  id: string;
  name: string;
  description: string;
  image: string;
  itemCount: number;
}

const categories: Category[] = [
  {
    id: "aviator-glasses",
    name: "Aviator Glasses",
    description: "Timeless designs inspired by pilot eyewear",
    image: "/placeholder.svg",
    itemCount: 24
  },
  {
    id: "pilot-watches",
    name: "Pilot Watches",
    description: "Precision timepieces with aviation heritage",
    image: "/placeholder.svg",
    itemCount: 18
  },
  {
    id: "flight-gear",
    name: "Flight Gear",
    description: "Authentic aviation-inspired accessories",
    image: "/placeholder.svg",
    itemCount: 15
  },
  {
    id: "accessories",
    name: "Accessories",
    description: "Complete your look with premium accessories",
    image: "/placeholder.svg",
    itemCount: 32
  }
];

const Categories = () => {
  return (
    <section className="py-16 bg-white">
      <div className="container mx-auto px-4">
        <div className="text-center mb-12">
          <h2 className="text-3xl font-bold mb-4">Shop By Category</h2>
          <p className="text-muted-foreground max-w-2xl mx-auto">
            Browse our collections inspired by aviation heritage and timeless design.
          </p>
        </div>
        
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
          {categories.map(category => (
            <Link 
              key={category.id} 
              to={`/category/${category.id}`}
              className="category-card group"
            >
              <div className="relative overflow-hidden rounded-lg">
                <img 
                  src={category.image} 
                  alt={category.name}
                  className="w-full h-80 object-cover transition-transform duration-500 group-hover:scale-110"
                />
                <div className="absolute inset-0 bg-gradient-to-t from-navy-dark/80 via-navy-dark/40 to-transparent"></div>
                <div className="absolute bottom-0 left-0 p-6 text-white">
                  <h3 className="text-xl font-bold mb-1">{category.name}</h3>
                  <p className="text-white/80 mb-2">{category.description}</p>
                  <span className="text-sm font-medium bg-white/20 backdrop-blur-sm px-3 py-1 rounded-full">
                    {category.itemCount} Products
                  </span>
                </div>
              </div>
            </Link>
          ))}
        </div>
      </div>
    </section>
  );
};

export default Categories;
