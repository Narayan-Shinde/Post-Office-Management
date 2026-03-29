const images = [
        "/postoffice/images/post.jpg", // First image (Zoom-in, Zoom-out)
        "/postoffice/images/postimage.jpg",     // Second (Left to right, Right to left)
        "/postoffice/images/saving.jpg",    // Third (Right to left, Left to right)
        "/postoffice/images/Account.jpg",    // Fourth (Top to bottom, Bottom to top)
        "/postoffice/images/parcel.png"     // Fifth (Bottom to top, Top to bottom)
    ];

    const entryAnimations = [
        "zoom-in",       // First image (Zoom-in)
        "slide-in-left", // Second (Left to right)
        "slide-in-right",// Third (Right to left)
        "slide-in-top",  // Fourth (Top to bottom)
        "slide-in-bottom"// Fifth (Bottom to top)
    ];

    const exitAnimations = [
        "zoom-out",       // First image (Zoom-out)
        "slide-out-right",// Second (Right to left exit)
        "slide-out-left", // Third (Left to right exit)
        "slide-out-top",  // Fourth (Bottom to top exit)
        "slide-out-bottom" // Fifth (Top to bottom exit)
    ];

    let index = 0;
    const imgElement = document.getElementById("slideshow");

    function preloadImage(src) {
        const img = new Image();
        img.src = src;
    }

    function changeImage() {
        imgElement.className = ""; // Reset animation class
        void imgElement.offsetWidth; // Force reflow
        imgElement.src = images[index]; // Change the image
        imgElement.classList.add(entryAnimations[index]); // Apply entry animation

        // Preload next image for seamless transition
        const nextIndex = (index + 1) % images.length;
        preloadImage(images[nextIndex]);

        // Apply exit animation before switching to the next image
        setTimeout(() => {
            imgElement.classList.remove(entryAnimations[index]); // Remove entry animation
            imgElement.classList.add(exitAnimations[index]); // Apply exit animation
        }, 2500); // Exit animation starts after 3.5s

        index = nextIndex; // Move to next image
    }

    // Start slideshow
    changeImage();
    setInterval(changeImage, 4000); // Change every 5 seconds continuously