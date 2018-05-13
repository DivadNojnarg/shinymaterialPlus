/* Masonry container for Gallery page
*/
  $(function() {
    var $containerGallery = $(".masonry-gallery-wrapper");
    $containerGallery.imagesLoaded(function() {
      $containerGallery.masonry({
        itemSelector: '.gallary-item img',
        columnWidth: '.gallary-sizer',
        isFitWidth: true
      });
    });
    
    //popup-gallery
    $('.popup-gallery').magnificPopup({
      delegate: 'a',
      type: 'image',
      closeOnContentClick: true,
      fixedContentPos: true,
      tLoading: 'Loading image #%curr%...',
      mainClass: 'mfp-img-mobile mfp-no-margins mfp-with-zoom',
      gallery: {
        enabled: true,
        navigateByImgClick: true,
        preload: [0, 1] // Will preload 0 - before current, and 1 after the current image
      },
      image: {
        verticalFit: true,
        tError: '<a href="%url%">The image #%curr%</a> could not be loaded.',
        titleSrc: function(item) {
          return item.el.attr('title') + '<small>by Marsel Van Oosten</small>';
        },
        zoom: {
          enabled: true,
          duration: 300 // don't foget to change the duration also in CSS
        }
        }
        });
        });