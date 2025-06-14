  const body = document.querySelector("body"),
      sideBar = body.querySelector(".sidebar"),
      toggleSideBar = body.querySelector(".toggle");

    // Toggle sidebar open/close
    toggleSideBar.addEventListener("click", () => {
      sideBar.classList.toggle("open");
    });



