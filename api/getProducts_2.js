async function fetchProducts() {
  const url = 'https://api.tiendanube.com/v1/4618329/products';
  const headers = {
    'Authorization': 'bearer 2f964227124e040643fb066c8890ec16dd12d248',
    'User-Agent': 'E-Commerce App (info@weredco.com)'
  };

  try {
    const response = await fetch(url, {
      method: 'GET',
      headers: headers
    });

    if (!response.ok) {
      throw new Error('Network response was not ok');
    }

    const data = await response.json();
    // Handle the data returned from the API
    console.log(data);
    // You can perform further processing here
  } catch (error) {
    // Handle errors
    console.error('There was a problem with the fetch operation:', error);
  }
}

// Call the function to fetch products
fetchProducts();
