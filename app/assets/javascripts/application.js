// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
var $container	= $('#ib-container'),
	$movies	= $container.children('movie'),
	timeout;

$movies.on( 'mouseenter', function( event ) {
		
	var $movie	= $(this);
	clearTimeout( timeout );
	timeout = setTimeout( function() {
		
		if( $movie.hasClass('active') ) return false;
		
		$movies.not($movie).removeClass('active').addClass('blur');
		
		$movie.removeClass('blur').addClass('active');
		
	}, 75 );
	
});

$container.on( 'mouseleave', function( event ) {
	
	clearTimeout( timeout );
	$movies.removeClass('active blur');
	
});