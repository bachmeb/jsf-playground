<%@taglib uri="http://java.sun.com/jsf/core" prefix="f"%>
<%@taglib uri="http://java.sun.com/jsf/html" prefix="h"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>

<f:view>
	<html lang="en">
<head>
<title>See Scopes Run</title>
</head>
<body>

	<p id="one">A globally-scoped variable</p>

	<script type="text/javascript">
		var a = 1;
		
		//global scope
		function one() {
		alert(a);
		
		var element = document.getElementById("one");
		element.style.color = "red";
		}
	</script>

	<pre>
		var a = 1;
		
		//global scope
		function one() {
		alert(a);
		}
	</pre>

	<p id="two">Local scope</p>

	<script type="text/javascript">
		var a = 1;
		
		function two(a) {
		  alert(a);
		}
		
		// local scope again
		function three() {
		  var a = 3;
		  alert(a);
		}
		
		var element = document.getElementById("two");
		element.style.color = "blue";
	</script>

	<pre>
		var a = 1;
		function two(a) {
		  alert(a);
		}
		
		// local scope again
		function three() {
		  var a = 3;
		  alert(a);
		}
	</pre>

	<p id="four">Intermediate: No such thing as block scope in
		JavaScript (ES5; ES6 introduces let)</p>

	<script type="text/javascript">
		var a = 1;
		
		function four() {
		  if (true) {
		    var a = 4;
		  }		
		  alert(a); // alerts '4', not the global value of '1'
		}
		
		var element = document.getElementById("four");
		element.style.color = "purple";
	</script>
	
	<pre>
		var a = 1;
		
		function four() {
		  if (true) {
		    var a = 4;
		  }
		
		  alert(a); // alerts '4', not the global value of '1'
		}
	</pre>
	
	<p id="five">Intermediate: Object properties</p>

	<script type="text/javascript">
		var a = 1;
		
		function five() {
		  this.a = 5;
		}
		var element = document.getElementById("five");
		element.style.color = "red";
	</script>
	
	<pre>
		var a = 1;
	
		function five() {
		  this.a = 5;
		}
	</pre>
	
	<p id="six">Advanced: Closure</p>

	<script type="text/javascript">
		var a = 1;
		
		var six = (function() {
		  var foo = 6;
		
		  return function() {
		    // JavaScript "closure" means I have access to foo in here,
		    // because it is defined in the function in which I was defined.
		    alert(foo);
		  };
		})();
		var element = document.getElementById("six");
		element.style.color = "red";
	</script>
	
	<pre>
	var a = 1;

	var six = (function() {
 	var foo = 6;

	  return function() {
	    // JavaScript "closure" means I have access to foo in here,
	    // because it is defined in the function in which I was defined.
	    alert(foo);
	  };
	})();
	</pre>
	
	<p id="seven">Advanced: Prototype-based scope resolution</p>

	<script type="text/javascript">
		var a = 1;
		
		function seven() {
		  this.a = 7;
		}
		
		// [object].prototype.property loses to
		// [object].property in the lookup chain. For example...
		
		// Won't get reached, because 'a' is set in the constructor above.
		seven.prototype.a = -1;
		
		// Will get reached, even though 'b' is NOT set in the constructor.
		seven.prototype.b = 8;
		
		var element = document.getElementById("seven");
		element.style.color = "red";
	</script>
	
	<pre>var a = 1;

function seven() {
  this.a = 7;
}

// [object].prototype.property loses to
// [object].property in the lookup chain. For example...

// Won't get reached, because 'a' is set in the constructor above.
seven.prototype.a = -1;

// Will get reached, even though 'b' is NOT set in the constructor.
seven.prototype.b = 8;</pre>

	<p id="eight">Altogether</p>

	<script type="text/javascript">
		//These will print 1-8
		one();
		two(2);
		three();
		four();
		alert(new five().a);
		six();
		alert(new seven().a);
		alert(new seven().b);
		var element = document.getElementById("eight");
		element.style.color = "red";
	</script>
	
	<pre>
		//These will print 1-8
		one();
		two(2);
		three();
		four();
		alert(new five().a);
		six();
		alert(new seven().a);
		alert(new seven().b);
	</pre>

	<p id="nine">Global+Local: An extra complex Case</p>

	<script type="text/javascript">
		var x = 5;
		
		(function () {
		    console.log(x);
		    var x = 10;
		    console.log(x); 
		})();
		
		var element = document.getElementById("nine");
		element.style.color = "red";
	</script>
	
	<pre>
		var x = 5;
	
		(function () {
		    console.log(x);
		    var x = 10;
		    console.log(x); 
		})();
	</pre>

	<h3 id="ten">This will print out undefined and 10 rather than 5
		and 10 since JavaScript always move variable declarations (not
		initializations) to the top of the scope, making the code equivalent
		to:</h3>

	<script type="text/javascript">
var x = 5;

(function () {
    var x;
    console.log(x);
    x = 10;
    console.log(x); 
})();
var element = document.getElementById("ten");
element.style.color = "red";
</script>
	<pre>var x = 5;

(function () {
    var x;
    console.log(x);
    x = 10;
    console.log(x); 
})();</pre>

	<p id="eleven">Catch clause-scoped variable</p>
	<script type="text/javascript">
var e = 5;
console.log(e);
try {
    throw 6;
} catch (e) {
    console.log(e);
}
console.log(e);
var element = document.getElementById("eleven");
element.style.color = "red";
</script>
	<pre>var e = 5;
console.log(e);
try {
    throw 6;
} catch (e) {
    console.log(e);
}
console.log(e);</pre>

	<h3>This will print out 5, 6, 5. Inside the catch clause e shadows
		global and local variables. But this special scope is only for the
		caught variable. If you write var f; inside the catch clause, then
		it's exactly the same as if you had defined it before or after the
		try-catch block.</h3>



</body>
	</html>
</f:view>