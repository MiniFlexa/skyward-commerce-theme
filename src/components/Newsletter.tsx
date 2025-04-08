
import React, { useState } from 'react';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { toast } from 'sonner';

const Newsletter = () => {
  const [email, setEmail] = useState('');

  const handleSubscribe = (e: React.FormEvent) => {
    e.preventDefault();
    
    if (!email || !email.includes('@')) {
      toast.error('Please enter a valid email address');
      return;
    }
    
    // This would normally submit to an API
    toast.success('Thank you for subscribing!');
    setEmail('');
  };

  return (
    <section className="bg-sky-gradient py-16">
      <div className="container mx-auto px-4">
        <div className="max-w-2xl mx-auto text-center">
          <h2 className="text-3xl font-bold mb-4 text-navy-dark">Stay Updated</h2>
          <p className="text-navy mb-8">
            Subscribe to receive updates on new products, special offers, and aviation-inspired content.
          </p>
          
          <form onSubmit={handleSubscribe} className="flex flex-col sm:flex-row gap-4">
            <Input
              type="email"
              placeholder="Your email address"
              className="aviation-input flex-grow"
              value={email}
              onChange={(e) => setEmail(e.target.value)}
            />
            <Button type="submit" className="bg-navy-dark hover:bg-navy text-white">
              Subscribe
            </Button>
          </form>
          
          <p className="text-xs text-navy-light/80 mt-4">
            By subscribing, you agree to our Privacy Policy and consent to receive our promotional emails.
          </p>
        </div>
      </div>
    </section>
  );
};

export default Newsletter;
