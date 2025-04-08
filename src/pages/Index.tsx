
import React from 'react';
import Navbar from '@/components/Navbar';
import HeroSection from '@/components/HeroSection';
import FeaturedProducts from '@/components/FeaturedProducts';
import Categories from '@/components/Categories';
import FeaturesBanner from '@/components/FeaturesBanner';
import Newsletter from '@/components/Newsletter';
import Footer from '@/components/Footer';

const Index = () => {
  return (
    <div className="min-h-screen flex flex-col">
      <Navbar />
      <main>
        <HeroSection />
        <FeaturesBanner />
        <FeaturedProducts />
        <Categories />
        <Newsletter />
      </main>
      <Footer />
    </div>
  );
};

export default Index;
