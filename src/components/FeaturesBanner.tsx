
import React from 'react';
import { Truck, Award, Package, RefreshCw } from 'lucide-react';

const features = [
  {
    icon: <Truck className="h-6 w-6 text-navy-dark" />,
    title: "Free Shipping",
    description: "On orders over $100"
  },
  {
    icon: <Award className="h-6 w-6 text-navy-dark" />,
    title: "2-Year Warranty",
    description: "On all premium models"
  },
  {
    icon: <Package className="h-6 w-6 text-navy-dark" />,
    title: "Secure Packaging",
    description: "For safe delivery"
  },
  {
    icon: <RefreshCw className="h-6 w-6 text-navy-dark" />,
    title: "Easy Returns",
    description: "30-day money back"
  }
];

const FeaturesBanner = () => {
  return (
    <section className="py-12 bg-white border-y border-gray-200">
      <div className="container mx-auto px-4">
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-8">
          {features.map((feature, index) => (
            <div 
              key={index} 
              className="flex flex-col items-center text-center p-4"
            >
              <div className="bg-sky-light p-3 rounded-full mb-4">
                {feature.icon}
              </div>
              <h3 className="font-semibold text-lg mb-2">{feature.title}</h3>
              <p className="text-muted-foreground">{feature.description}</p>
            </div>
          ))}
        </div>
      </div>
    </section>
  );
};

export default FeaturesBanner;
