
import React from 'react';
import { useParams } from 'react-router-dom';
import Navbar from '@/components/Navbar';
import Footer from '@/components/Footer';
import ProductGrid from '@/components/ProductGrid';
import { Breadcrumb, BreadcrumbItem, BreadcrumbLink, BreadcrumbList, BreadcrumbSeparator } from '@/components/ui/breadcrumb';
import { Home } from 'lucide-react';

const CategoryPage = () => {
  const { categoryId } = useParams();
  
  // In a real application, you would fetch the category details and products based on categoryId
  // For this example, we'll use hardcoded data
  const category = {
    id: categoryId,
    name: categoryId?.split('-').map(word => word.charAt(0).toUpperCase() + word.slice(1)).join(' '),
    description: "Browse our collection of premium aviation-inspired products."
  };

  return (
    <div className="min-h-screen flex flex-col">
      <Navbar />
      <main>
        <section className="py-8 bg-gray-50">
          <div className="container mx-auto px-4">
            <Breadcrumb>
              <BreadcrumbList>
                <BreadcrumbItem>
                  <BreadcrumbLink href="/">
                    <Home className="h-4 w-4 mr-1" />
                    Home
                  </BreadcrumbLink>
                </BreadcrumbItem>
                <BreadcrumbSeparator />
                <BreadcrumbItem>
                  <BreadcrumbLink href="/categories">Categories</BreadcrumbLink>
                </BreadcrumbItem>
                <BreadcrumbSeparator />
                <BreadcrumbItem>
                  <BreadcrumbLink>{category.name}</BreadcrumbLink>
                </BreadcrumbItem>
              </BreadcrumbList>
            </Breadcrumb>
          </div>
        </section>

        <section className="py-12">
          <div className="container mx-auto px-4">
            <div className="text-center mb-12">
              <h1 className="text-3xl font-bold mb-4">{category.name}</h1>
              <p className="text-muted-foreground max-w-2xl mx-auto">
                {category.description}
              </p>
            </div>
            
            <ProductGrid categoryId={categoryId} />
          </div>
        </section>
      </main>
      <Footer />
    </div>
  );
};

export default CategoryPage;
