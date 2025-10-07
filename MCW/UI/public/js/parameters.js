// Retrieve parameters from the URL query string
        const urlParams = new URLSearchParams(window.location.search);
        console.log(urlParams);
        const fPosx = urlParams.get('fPosx');
        const fPosy = urlParams.get('fPosy');
        const fPosz = urlParams.get('fPosz');
        const fOrientation= urlParams.get('fOrientation');
        const fRotation = urlParams.get('fRotation');
        // const overLoop = urlParams.get('overLoop');
        // const rpm = urlParams.get('rpm');

        // Set the initial values of input fields
        document.getElementById('fPosx').value = fPosx || '0.0';
        document.getElementById('fPosy').value = fPosy || '0.0';
        document.getElementById('fPosz').value = fPosz || '0.0';
        document.getElementById('fOrientation').value = fOrientation || '0.0';
        document.getElementById('fRotation').value = fRotation || '0.0';
        // document.getElementById('overLoop').value = overLoop || '0.0';
        // document.getElementById('rpm').value = rpm || '0.0';      