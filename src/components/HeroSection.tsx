
import React from 'react';
import { Button } from '@/components/ui/button';

const HeroSection = () => {
  return (
    <section className="relative h-[500px] overflow-hidden">
      <div className="absolute inset-0 bg-sky-gradient"></div>
      
      <div className="absolute inset-0 flex items-center">
        <div className="container mx-auto px-4">
          <div className="max-w-lg">
            <h1 className="text-4xl md:text-5xl font-bold text-white mb-4 drop-shadow-lg">
              Elevate Your Style
            </h1>
            <p className="text-lg md:text-xl text-white/90 mb-8 drop-shadow-md">
              Premium aviator glasses and accessories inspired by the golden age of flight.
            </p>
            <div className="flex flex-col sm:flex-row space-y-4 sm:space-y-0 sm:space-x-4">
              <Button className="bg-navy-dark hover:bg-navy text-white font-medium px-8 py-6 rounded-md text-lg">
                Shop Collection
              </Button>
              <Button variant="outline" className="bg-white/10 backdrop-blur-sm border-white/20 text-white hover:bg-white/20 font-medium px-8 py-6 rounded-md text-lg">
                Learn More
              </Button>
            </div>
          </div>
        </div>
      </div>
      
      {/* Decorative elements */}
      <div className="absolute right-0 top-1/2 -translate-y-1/2 hidden lg:block">
        <div className="relative w-[500px] h-[500px]">
          <div className="absolute right-32 top-0 bg-white/10 backdrop-blur-md rounded-full w-64 h-64 animate-float"></div>
          <div className="absolute right-10 top-32 bg-white/20 backdrop-blur-md rounded-full w-48 h-48 animate-float" style={{ animationDelay: '0.5s' }}></div>
          <div className="absolute right-40 top-48 bg-white/30 backdrop-blur-md rounded-full w-32 h-32 animate-float" style={{ animationDelay: '1s' }}></div>
        </div>
      </div>
    </section>
  );
};

export default HeroSection;
