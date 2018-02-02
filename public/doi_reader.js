// const API_KEY = "55b83dd7db8f90e7aa8277fe34943e5e589658a06971ac1218021d6aa30901e1";
const BASE_URL = 'https://doi.org/';

// HTTP REQUESTS

const Citation = {
  get (doi) {
    return fetch(
      `${BASE_URL}/${doi}`,
      {
        headers: {
          'Accept': 'text/x-bibliography; style=apa'
         }
      }
    )
      .then(res=> console.log(res.value))
  }
}
