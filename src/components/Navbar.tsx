
import React, { useState } from 'react';
import { Link } from 'react-router-dom';
import { Search, ShoppingCart, User, Menu, X } from 'lucide-react';
import { Button } from '@/components/ui/button';

const Navbar = () => {
  const [isMenuOpen, setIsMenuOpen] = useState(false);

  return (
    <nav className="bg-white shadow-sm sticky top-0 z-50">
      <div className="container mx-auto px-4 py-4">
        <div className="flex items-center justify-between">
          <div className="flex items-center space-x-8">
            <Link to="/" className="flex items-center space-x-2">
              <span className="text-2xl font-bold text-navy-dark">SKYWARD</span>
            </Link>
            
            <div className="hidden md:flex space-x-6">
              <Link to="/category/aviator-glasses" className="navbar-link">Aviator Glasses</Link>
              <Link to="/category/pilot-watches" className="navbar-link">Pilot Watches</Link>
              <Link to="/category/flight-gear" className="navbar-link">Flight Gear</Link>
              <Link to="/category/accessories" className="navbar-link">Accessories</Link>
            </div>
          </div>
          
          <div className="hidden md:flex items-center space-x-4">
            <div className="relative">
              <input 
                type="text"
                placeholder="Search products..."
                className="aviation-input pl-10 w-64"
              />
              <Search className="absolute left-3 top-2.5 h-4 w-4 text-gray-400" />
            </div>
            
            <Button variant="ghost" size="icon">
              <User className="h-5 w-5" />
            </Button>
            
            <Button variant="ghost" size="icon" className="relative">
              <ShoppingCart className="h-5 w-5" />
              <span className="absolute -top-1 -right-1 bg-accent text-white text-xs rounded-full h-5 w-5 flex items-center justify-center">3</span>
            </Button>
          </div>
          
          {/* Mobile menu button */}
          <div className="md:hidden">
            <Button variant="ghost" size="icon" onClick={() => setIsMenuOpen(!isMenuOpen)}>
              {isMenuOpen ? <X className="h-6 w-6" /> : <Menu className="h-6 w-6" />}
            </Button>
          </div>
        </div>
        
        {/* Mobile menu */}
        {isMenuOpen && (
          <div className="md:hidden pt-4 pb-2 border-t mt-4">
            <div className="flex flex-col space-y-4">
              <Link to="/category/aviator-glasses" className="navbar-link block py-2">Aviator Glasses</Link>
              <Link to="/category/pilot-watches" className="navbar-link block py-2">Pilot Watches</Link>
              <Link to="/category/flight-gear" className="navbar-link block py-2">Flight Gear</Link>
              <Link to="/category/accessories" className="navbar-link block py-2">Accessories</Link>
              
              <div className="relative mt-2">
                <input 
                  type="text"
                  placeholder="Search products..."
                  className="aviation-input pl-10 w-full"
                />
                <Search className="absolute left-3 top-2.5 h-4 w-4 text-gray-400" />
              </div>
              
              <div className="flex space-x-4 py-2">
                <Button variant="outline" className="flex items-center space-x-2 w-1/2">
                  <User className="h-4 w-4" />
                  <span>Account</span>
                </Button>
                
                <Button variant="outline" className="flex items-center space-x-2 w-1/2 relative">
                  <ShoppingCart className="h-4 w-4" />
                  <span>Cart</span>
                  <span className="absolute -top-1 -right-1 bg-accent text-white text-xs rounded-full h-5 w-5 flex items-center justify-center">3</span>
                </Button>
              </div>
            </div>
          </div>
        )}
      </div>
    </nav>
  );
};

export default Navbar;
