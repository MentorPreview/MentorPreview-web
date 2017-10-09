($(".img-box.course-modal-button").on('click',function(){
        courseDiv = $(this)
        courseId = courseDiv.children("#course-id").attr('value');
        courseImgUrl = courseDiv.children("#course-img").attr('src');
        courseName = courseDiv.children("#course-name").text();
        
        $(".ajax-mentor").remove();
        $.ajax({
          type: "POST",
          url: "./course/mentors",
          data: {"courseId": courseId},
          success: function(html){
            $("#course-mentor-item").append(html);
            $(".loader#course-mentor-item").fadeOut(100);
            $("#course-mentor-item .ajax-mentor").each(function(i,item){
                $(item).delay(100).fadeIn(10);
            });
            $("#course-mentor-item .ajax-mentor").each(function(i,item){
                $(item).delay(i*50).queue(function(next) {
                    $(this).animate({opacity: 1}, 100);
                    next();
                });
            })
          }
        });
        
        $(".ajax-mentor").remove();
        $.ajax({
          type: "POST",
          url: "./course/mentors",
          data: {"courseId": courseId},
          success: function(html){
            $("#camp-mentor-item").append(html);
            $(".loader#course-mentor-item").fadeOut(100);
            $("#course-mentor-item .ajax-mentor").each(function(i,item){
                $(item).delay(100).fadeIn(10);
            });
            $("#course-mentor-item .ajax-mentor").each(function(i,item){
                $(item).delay(i*50).queue(function(next) {
                    $(this).animate({opacity: 1}, 100);
                    next();
                });
            })
          }
        });
        
        $("#modal-course-name").text(courseName);
        $("#modal-course-img").attr('src',courseImgUrl);
        $("#course-modal").addClass("active");
    }));
    ($(".close-modal-button").on('click',function(){
        $(".filter.active").removeClass("active");
        $(".loader").show();
    }));