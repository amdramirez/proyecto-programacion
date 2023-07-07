function course_register() {
    function init() {
        var url = new URL(window.location.href);
        var course = url.searchParams.get("course");
        setCourse(course);
    }

    function setCourse(course) {
        var course_name_element = document.querySelector("#course-name");
        course_name_element.textContent += course.charAt(0).toUpperCase() + course.slice(1).replaceAll('_',' ');

        var course_input = document.querySelector("#course");
        course_input.setAttribute('value',course);
    }

  
    return {
      init: init
    };
  }
  
  // Acciones al cargar la página
  window.addEventListener('load', function() {
    course_register().init();
  });