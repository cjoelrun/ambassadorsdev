$(document).ready(function(){
		      // Just the defaults.
		      $("span.pie").peity("pie")

		      // Set a custom colour and/or diameter.
		      $(".diameter span").peity("pie", {
						    colours: function() {
							return ["#dddddd", this.getAttribute("data-colour")]
						    },
						    diameter: function() {
							return this.getAttribute("data-diameter")
						    }
						})
		  })