import places from 'places.js';

const initAutocomplete = () => {
  const addressInput = document.getElementById('entreprise_adresse');
  if (addressInput) {
    places({ container: addressInput });
  }
  const addressactiviteInput = document.getElementById('activite_address');
  if (addressactiviteInput) {
    places({ container: addressactiviteInput });
  }
};
export { initAutocomplete };
