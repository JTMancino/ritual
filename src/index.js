// src/index.js
import { createClient } from 'https://cdn.jsdelivr.net/npm/@supabase/supabase-js/+esm';

// Replace these with your actual Supabase details
const SUPABASE_URL = 'https://evutzmgyoqnlsihcgcog.supabase.co';
const SUPABASE_ANON_KEY = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImV2dXR6bWd5b3FubHNpaGNnY29nIiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDA2NDI2MzEsImV4cCI6MjA1NjIxODYzMX0.9D5nTnVLlBUZG-dPb3uTbV3usLnQ3c9fFVVdVOzhHDM';

const supabase = createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

document.addEventListener('DOMContentLoaded', () => {
  const signupForm = document.getElementById('signup-form');
  const loginForm = document.getElementById('login-form');

  // Handle user sign-up
  if (signupForm) {
    signupForm.addEventListener('submit', async (e) => {
      e.preventDefault();
      const email = document.getElementById('signup-email').value;
      const password = document.getElementById('signup-password').value;

      const { data, error } = await supabase.auth.signUp({ email, password });

      if (error) {
        console.error('Sign Up Error:', error.message);
        alert(`Sign Up Error: ${error.message}`);
      } else {
        // console.log('Sign Up Successful:', data.user);
        alert('Sign up successful! Check your email to confirm your account if necessary.');
      }
    });
  }

  // Handle user login using signInWithPassword
  if (loginForm) {
    loginForm.addEventListener('submit', async (e) => {
      e.preventDefault();
      const email = document.getElementById('login-email').value;
      const password = document.getElementById('login-password').value;

      const { data, error } = await supabase.auth.signInWithPassword({ email, password });

      if (error) {
        console.error('Login Error:', error.message);
        alert(`Login Error: ${error.message}`);
      } else {
        console.log('Login Successful:', data.user);
        // alert('Login successful!');
        // Redirect to the home page (or update the UI as needed)
        window.location.href = 'home.html';
      }
    });
  }
});
