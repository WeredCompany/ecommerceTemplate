
async function handler(req, res) {


const url = 'https://api.tiendanube.com/v1/4618329/products';
const headers = {
  'Authorization': 'bearer 2f964227124e040643fb066c8890ec16dd12d248',
  'User-Agent': 'E-Commerce App (info@weredco.com)'
};

  try {
    const externalApiResponse = await fetch(
      url,
      {
        method: "GET",
        headers:headers,
      },
    );

    if (!externalApiResponse.ok) {
      throw new Error(`Error: ${externalApiResponse.status}`);
    }
    const data = await externalApiResponse.json();
    res.status(200).json(data);
  } catch (error) {
    res.status(500).json({ message: error.message });
  }
}

export default handler;
