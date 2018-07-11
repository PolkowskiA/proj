$(document).on("turbolinks:load", function() {


	$('.star-rating').raty({
		readOnly: true,
		path: '/assets/',
		score: function(){
			return $(this).atrr('data-score');
		}
	});

	$('.comment_rating').raty({
		readOnly: true,
		path: '/assets',
		score: function(){
			return $(this).atrr('data-score');
		}
	});
Turbolinks.clearCache()
} );