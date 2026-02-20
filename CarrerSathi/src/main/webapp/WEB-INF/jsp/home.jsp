<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>CareerSaathi</title>
    <!-- Bootstrap CSS -->
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
      rel="stylesheet"
    />
    <!-- Custom CSS -->
   <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" />
    <!-- Bootstrap Icons -->
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css"
    />
  </head>
  <body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark">
      <div class="container-fluid">
        <!-- Brand/Logo -->
        <a class="navbar-brand" href="${pageContext.request.contextPath}/home">
          <span style="color: #ffffff">Career</span
          ><span style="color: #ffc107">Saathi</span>
        </a>

        <!-- Toggle Button for Mobile -->
        <button
          class="navbar-toggler"
          type="button"
          data-bs-toggle="collapse"
          data-bs-target="#navbarNav"
          aria-controls="navbarNav"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>

        <!-- Navbar Items -->
        <div class="collapse navbar-collapse" id="navbarNav">
          <ul class="navbar-nav">
            <li class="nav-item">
              <a class="nav-link active" aria-current="page" href="${pageContext.request.contextPath}/home"
                >Home</a
              >
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath}/about">About</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath}/whatwedo">What We Do</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="${pageContext.request.contextPath}/contactus">Contact Us</a>
            </li>
          </ul>

          <!-- Auth Buttons on Right -->
          <ul class="navbar-nav ms-auto align-items-center auth-buttons">
            <li class="nav-item">
              <a href="${pageContext.request.contextPath}/login" class="btn btn-auth login">Login</a>
            </li>
            <li class="nav-item">
              <a href="${pageContext.request.contextPath}/signup" class="btn btn-auth signup">Sign Up</a>
            </li>
          </ul>
        </div>
      </div>
    </nav>

    <!-- Image Carousel Section -->
    <section class="carousel-section">
      <div
        id="carouselServices"
        class="carousel slide"
        data-bs-ride="carousel"
        data-bs-interval="4000"
      >
        <div class="carousel-indicators">
          <button
            type="button"
            data-bs-target="#carouselServices"
            data-bs-slide-to="0"
            class="active"
            aria-current="true"
            aria-label="Career Counseling"
          ></button>
          <button
            type="button"
            data-bs-target="#carouselServices"
            data-bs-slide-to="1"
            aria-label="College Admission Guidance"
          ></button>
          <button
            type="button"
            data-bs-target="#carouselServices"
            data-bs-slide-to="2"
            aria-label="Study Abroad Consultation"
          ></button>
          <button
            type="button"
            data-bs-target="#carouselServices"
            data-bs-slide-to="3"
            aria-label="Scholarship Guidance"
          ></button>
          <button
            type="button"
            data-bs-target="#carouselServices"
            data-bs-slide-to="4"
            aria-label="Exam Preparation Advice"
          ></button>
        </div>
        <div class="carousel-inner">
          <div class="carousel-item active">
            <img
              src="https://images.pexels.com/photos/5905962/pexels-photo-5905962.jpeg?auto=compress&cs=tinysrgb&w=1200"
              class="d-block w-100"
              alt="Career Counseling"
            />
            <div class="carousel-caption">
              <h3>Career Counseling</h3>
              <p>Expert guidance to help you choose the right career path</p>
            </div>
          </div>
          <div class="carousel-item">
            <img
              src="https://images.pexels.com/photos/4144923/pexels-photo-4144923.jpeg?auto=compress&cs=tinysrgb&w=1200"
              class="d-block w-100"
              alt="College Admission Guidance"
            />
            <div class="carousel-caption">
              <h3>College Admission Guidance</h3>
              <p>Navigate the college admission process with ease</p>
            </div>
          </div>
          <div class="carousel-item">
            <img
              src="https://images.pexels.com/photos/2398220/pexels-photo-2398220.jpeg?auto=compress&cs=tinysrgb&w=1200"
              class="d-block w-100"
              alt="Study Abroad Consultation"
            />
            <div class="carousel-caption">
              <h3>Study Abroad Consultation</h3>
              <p>
                Explore opportunities to study in top universities worldwide
              </p>
            </div>
          </div>
          <div class="carousel-item">
            <img
              src="https://images.pexels.com/photos/3228727/pexels-photo-3228727.jpeg?auto=compress&cs=tinysrgb&w=1200"
              class="d-block w-100"
              alt="Scholarship Guidance"
            />
            <div class="carousel-caption">
              <h3>Scholarship Guidance</h3>
              <p>Find and apply for scholarships that suit your profile</p>
            </div>
          </div>
          <div class="carousel-item">
            <img
              src="https://images.pexels.com/photos/4145153/pexels-photo-4145153.jpeg?auto=compress&cs=tinysrgb&w=1200"
              class="d-block w-100"
              alt="Exam Preparation Advice"
            />
            <div class="carousel-caption">
              <h3>Exam Preparation Advice</h3>
              <p>Strategic tips and guidance for all competitive exams</p>
            </div>
          </div>
        </div>
        <button
          class="carousel-control-prev"
          type="button"
          data-bs-target="#carouselServices"
          data-bs-slide="prev"
        >
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Previous</span>
        </button>
        <button
          class="carousel-control-next"
          type="button"
          data-bs-target="#carouselServices"
          data-bs-slide="next"
        >
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="visually-hidden">Next</span>
        </button>
      </div>
    </section>

    <!-- Testimonials Section -->
    <section class="testimonials-section py-5">
      <div class="container">
        <h2 class="testimonials-title mb-5">Student Success Stories</h2>
        <div class="row g-4">
          <!-- Testimonial Card 1 -->
          <div class="col-md-6 col-lg-4">
            <div class="testimonial-card">
              <div class="testimonial-header">
                <img
                  src="https://images.pexels.com/photos/3807517/pexels-photo-3807517.jpeg?auto=compress&cs=tinysrgb&w=400"
                  alt="Student 1"
                  class="student-avatar"
                />
                <div class="student-info">
                  <h5 class="student-name">Aarav Kumar</h5>
                  <p class="student-title">IIT Delhi Student</p>
                </div>
              </div>
              <div class="rating">
                <span class="stars">★★★★★</span>
                <span class="rating-text">5.0/5.0</span>
              </div>
              <p class="testimonial-text">
                "CareerSaathi helped me navigate my college admission process
                smoothly. The guidance was invaluable and I got admitted to my
                dream college!"
              </p>
              <span class="feedback-tag">College Admission Guidance</span>
            </div>
          </div>

          <!-- Testimonial Card 2 -->
          <div class="col-md-6 col-lg-4">
            <div class="testimonial-card">
              <div class="testimonial-header">
                <img
                  src="https://images.pexels.com/photos/1181690/pexels-photo-1181690.jpeg?auto=compress&cs=tinysrgb&w=400"
                  alt="Student 2"
                  class="student-avatar"
                />
                <div class="student-info">
                  <h5 class="student-name">Priya Sharma</h5>
                  <p class="student-title">MIT, USA Scholar</p>
                </div>
              </div>
              <div class="rating">
                <span class="stars">★★★★★</span>
                <span class="rating-text">5.0/5.0</span>
              </div>
              <p class="testimonial-text">
                "The study abroad consultation was exceptional! They helped me
                secure a full scholarship to MIT. Best decision ever!"
              </p>
              <span class="feedback-tag">Study Abroad Consultation</span>
            </div>
          </div>

          <!-- Testimonial Card 3 -->
          <div class="col-md-6 col-lg-4">
            <div class="testimonial-card">
              <div class="testimonial-header">
                <img
                  src="https://images.pexels.com/photos/1181472/pexels-photo-1181472.jpeg?auto=compress&cs=tinysrgb&w=400"
                  alt="Student 3"
                  class="student-avatar"
                />
                <div class="student-info">
                  <h5 class="student-name">Rohit Patel</h5>
                  <p class="student-title">JEE Advanced Topper</p>
                </div>
              </div>
              <div class="rating">
                <span class="stars">★★★★★</span>
                <span class="rating-text">5.0/5.0</span>
              </div>
              <p class="testimonial-text">
                "The exam preparation advice really made a difference. Cracked
                JEE Advanced with their guidance and personalized strategies!"
              </p>
              <span class="feedback-tag">Exam Preparation</span>
            </div>
          </div>

          <!-- Testimonial Card 4 -->
          <div class="col-md-6 col-lg-4">
            <div class="testimonial-card">
              <div class="testimonial-header">
                <img
                  src="https://images.pexels.com/photos/1239291/pexels-photo-1239291.jpeg?auto=compress&cs=tinysrgb&w=400"
                  alt="Student 4"
                  class="student-avatar"
                />
                <div class="student-info">
                  <h5 class="student-name">Anjali Singh</h5>
                  <p class="student-title">Scholarship Recipient</p>
                </div>
              </div>
              <div class="rating">
                <span class="stars">★★★★☆</span>
                <span class="rating-text">4.8/5.0</span>
              </div>
              <p class="testimonial-text">
                "Thanks to the scholarship guidance, I received multiple
                scholarship offers from top universities. Highly recommended!"
              </p>
              <span class="feedback-tag">Scholarship Guidance</span>
            </div>
          </div>

          <!-- Testimonial Card 5 -->
          <div class="col-md-6 col-lg-4">
            <div class="testimonial-card">
              <div class="testimonial-header">
                <img
                  src="https://images.pexels.com/photos/3931603/pexels-photo-3931603.jpeg?auto=compress&cs=tinysrgb&w=400"
                  alt="Student 5"
                  class="student-avatar"
                />
                <div class="student-info">
                  <h5 class="student-name">Vikram Desai</h5>
                  <p class="student-title">Career Counseling Success</p>
                </div>
              </div>
              <div class="rating">
                <span class="stars">★★★★★</span>
                <span class="rating-text">5.0/5.0</span>
              </div>
              <p class="testimonial-text">
                "Career counseling helped me identify my true passion. Now I'm
                pursuing a career I love with confidence!"
              </p>
              <span class="feedback-tag">Career Counseling</span>
            </div>
          </div>

          <!-- Testimonial Card 6 -->
          <div class="col-md-6 col-lg-4">
            <div class="testimonial-card">
              <div class="testimonial-header">
                <img
                  src="https://images.pexels.com/photos/3769021/pexels-photo-3769021.jpeg?auto=compress&cs=tinysrgb&w=400"
                  alt="Student 6"
                  class="student-avatar"
                />
                <div class="student-info">
                  <h5 class="student-name">Neha Verma</h5>
                  <p class="student-title">NUS Singapore Student</p>
                </div>
              </div>
              <div class="rating">
                <span class="stars">★★★★★</span>
                <span class="rating-text">5.0/5.0</span>
              </div>
              <p class="testimonial-text">
                "Amazing support throughout my journey! From admission to visa,
                they handled everything professionally. Grateful!"
              </p>
              <span class="feedback-tag">Study Abroad Guidance</span>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Resources Section -->
    <section class="resources-section" id="resources">
      <div class="container">
        <h1
          class="section-title text-center mb-5"
          style="color: white !important"
        >
          Student <span style="color: white !important">Resources</span>
        </h1>

        <div class="row g-4">
          <!-- Blogs/Articles Card -->
          <div class="col-md-6 col-lg-3">
            <div class="resource-card">
              <div class="card-img-wrapper">
                <img
                  src="https://images.pexels.com/photos/261662/pexels-photo-261662.jpeg?auto=compress&cs=tinysrgb&w=600"
                  alt="Blogs and Articles"
                />
              </div>
              <div class="card-content">
                <div class="icon-box">
                  <i class="bi bi-newspaper"></i>
                </div>
                <h3>Blogs & Articles</h3>
                <p>
                  Deep dives into career paths, success stories, and educational
                  trends.
                </p>
                <a href="#" class="btn-read-more">Read Blogs</a>
              </div>
            </div>
          </div>

          <!-- Career Tips Card -->
          <div class="col-md-6 col-lg-3">
            <div class="resource-card">
              <div class="card-img-wrapper">
                <img
                  src="https://images.pexels.com/photos/590022/pexels-photo-590022.jpeg?auto=compress&cs=tinysrgb&w=600"
                  alt="Career Tips"
                />
              </div>
              <div class="card-content">
                <div class="icon-box">
                  <i class="bi bi-lightbulb"></i>
                </div>
                <h3>Career Tips</h3>
                <p>
                  Expert advice on resume building, interview preparation, and
                  soft skills.
                </p>
                <a href="#" class="btn-read-more">Get Tips</a>
              </div>
            </div>
          </div>

          <!-- Admission Updates Card -->
          <div class="col-md-6 col-lg-3">
            <div class="resource-card">
              <div class="card-img-wrapper">
                <img
                  src="https://images.pexels.com/photos/1438081/pexels-photo-1438081.jpeg?auto=compress&cs=tinysrgb&w=600"
                  alt="Admission Updates"
                />
              </div>
              <div class="card-content">
                <div class="icon-box">
                  <i class="bi bi-bell"></i>
                </div>
                <h3>Admission Updates</h3>
                <p>
                  Real-time notifications on college application deadlines and
                  forms.
                </p>
                <a href="#" class="btn-read-more">View Updates</a>
              </div>
            </div>
          </div>

          <!-- Exam Alerts Card -->
          <div class="col-md-6 col-lg-3">
            <div class="resource-card">
              <div class="card-img-wrapper">
                <img
                  src="https://images.pexels.com/photos/280222/pexels-photo-280222.jpeg?auto=compress&cs=tinysrgb&w=600"
                  alt="Exam Alerts"
                />
              </div>
              <div class="card-content">
                <div class="icon-box">
                  <i class="bi bi-calendar-event"></i>
                </div>
                <h3>Exam Alerts</h3>
                <p>
                  Stay informed about competitive exam dates, patterns, and
                  result announcements.
                </p>
                <a href="#" class="btn-read-more">Check Alerts</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- FAQ Section -->
    <section class="faq-section py-5 bg-light">
      <div class="container">
        <h2 class="text-center mb-5 fw-bold" style="color: #1a1a1a">
          Frequently Asked Questions
        </h2>
        <div class="row justify-content-center">
          <div class="col-lg-8">
            <div class="accordion" id="faqAccordion">
              <!-- FAQ Item 1 -->
              <div class="accordion-item shadow-sm mb-3">
                <h2 class="accordion-header" id="headingOne">
                  <button
                    class="accordion-button collapsed fw-bold"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#collapseOne"
                    aria-expanded="false"
                    aria-controls="collapseOne"
                  >
                    How to book a session?
                  </button>
                </h2>
                <div
                  id="collapseOne"
                  class="accordion-collapse collapse"
                  aria-labelledby="headingOne"
                  data-bs-parent="#faqAccordion"
                >
                  <div class="accordion-body text-secondary">
                    Booking a session is simple! You can click on the
                    <strong>'Contact Us'</strong> button in the navigation menu
                    to fill out our inquiry form. Alternatively, you can
                    directly call our helpline number listed in the footer or
                    email us at support@careersaathi.com. Our team will get back
                    to you within 24 hours to schedule your appointment.
                  </div>
                </div>
              </div>

              <!-- FAQ Item 2 -->
              <div class="accordion-item shadow-sm mb-3">
                <h2 class="accordion-header" id="headingTwo">
                  <button
                    class="accordion-button collapsed fw-bold"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#collapseTwo"
                    aria-expanded="false"
                    aria-controls="collapseTwo"
                  >
                    What is the cost of a session?
                  </button>
                </h2>
                <div
                  id="collapseTwo"
                  class="accordion-collapse collapse"
                  aria-labelledby="headingTwo"
                  data-bs-parent="#faqAccordion"
                >
                  <div class="accordion-body text-secondary">
                    We believe in accessible education guidance for everyone.
                    Our initial
                    <strong>15-minute consultation is completely FREE</strong>.
                    For in-depth career counseling, college admission guidance,
                    or study abroad planning, our paid packages start from as
                    low as <strong>₹999</strong> per session. We also offer
                    comprehensive yearly packages for students requiring
                    long-term mentorship.
                  </div>
                </div>
              </div>

              <!-- FAQ Item 3 -->
              <div class="accordion-item shadow-sm mb-3">
                <h2 class="accordion-header" id="headingThree">
                  <button
                    class="accordion-button collapsed fw-bold"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#collapseThree"
                    aria-expanded="false"
                    aria-controls="collapseThree"
                  >
                    Is the mode of counseling Online or Offline?
                  </button>
                </h2>
                <div
                  id="collapseThree"
                  class="accordion-collapse collapse"
                  aria-labelledby="headingThree"
                  data-bs-parent="#faqAccordion"
                >
                  <div class="accordion-body text-secondary">
                    We offer maximum flexibility to suit your convenience!
                    <ul>
                      <li>
                        <strong>Online:</strong> Video consultations via
                        Zoom/Google Meet are available for students across the
                        globe.
                      </li>
                      <li>
                        <strong>Offline:</strong> You can visit our centers in
                        major cities for a face-to-face interaction with our
                        experts.
                      </li>
                    </ul>
                    You can choose your preferred mode while booking the
                    appointment.
                  </div>
                </div>
              </div>
              <!-- FAQ Item 4 -->
              <div class="accordion-item shadow-sm mb-3">
                <h2 class="accordion-header" id="headingFour">
                  <button
                    class="accordion-button collapsed fw-bold"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#collapseFour"
                    aria-expanded="false"
                    aria-controls="collapseFour"
                  >
                    Who are the career counselors?
                  </button>
                </h2>
                <div
                  id="collapseFour"
                  class="accordion-collapse collapse"
                  aria-labelledby="headingFour"
                  data-bs-parent="#faqAccordion"
                >
                  <div class="accordion-body text-secondary">
                    Our team consists of <strong>certified career counselors</strong>, 
                    industry experts, and alumni from top universities like IITs, IIMs, 
                    and Ivy League colleges. They bring years of experience and deep 
                    domain knowledge to guide you effectively.
                  </div>
                </div>
              </div>

              <!-- FAQ Item 5 -->
              <div class="accordion-item shadow-sm mb-3">
                <h2 class="accordion-header" id="headingFive">
                  <button
                    class="accordion-button collapsed fw-bold"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#collapseFive"
                    aria-expanded="false"
                    aria-controls="collapseFive"
                  >
                    Do you provide support for international universities?
                  </button>
                </h2>
                <div
                  id="collapseFive"
                  class="accordion-collapse collapse"
                  aria-labelledby="headingFive"
                  data-bs-parent="#faqAccordion"
                >
                  <div class="accordion-body text-secondary">
                    Absolutely! We authorize a specialized team for 
                    <strong>Study Abroad</strong> consulting that covers applicants 
                    for the USA, UK, Canada, Australia, Germany, and more. From 
                    university selection and SOP writing to visa assistance, we cover it all.
                  </div>
                </div>
              </div>

              <!-- FAQ Item 6 -->
              <div class="accordion-item shadow-sm mb-3">
                <h2 class="accordion-header" id="headingSix">
                  <button
                    class="accordion-button collapsed fw-bold"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#collapseSix"
                    aria-expanded="false"
                    aria-controls="collapseSix"
                  >
                    Do you help with scholarship applications?
                  </button>
                </h2>
                <div
                  id="collapseSix"
                  class="accordion-collapse collapse"
                  aria-labelledby="headingSix"
                  data-bs-parent="#faqAccordion"
                >
                  <div class="accordion-body text-secondary">
                    Yes, ensuring financial feasibility is part of our guidance. 
                    We assist you in identifying relevant scholarships, 
                    financial aid programs, and education loans that suit your 
                    profile and ensure you have the best chance of securing funding.
                  </div>
                </div>
              </div>

              <!-- FAQ Item 7 -->
              <div class="accordion-item shadow-sm mb-3">
                <h2 class="accordion-header" id="headingSeven">
                  <button
                    class="accordion-button collapsed fw-bold"
                    type="button"
                    data-bs-toggle="collapse"
                    data-bs-target="#collapseSeven"
                    aria-expanded="false"
                    aria-controls="collapseSeven"
                  >
                    Can I change my counselor if I'm not satisfied?
                  </button>
                </h2>
                <div
                  id="collapseSeven"
                  class="accordion-collapse collapse"
                  aria-labelledby="headingSeven"
                  data-bs-parent="#faqAccordion"
                >
                  <div class="accordion-body text-secondary">
                    Your satisfaction is our priority. If you feel that your 
                    counselor is not the right fit for you, you can request a 
                    change after the first session. We will assign a senior 
                    mentor to review your case and ensure your needs are met.
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>



    <!-- Footer Section -->
    <footer class="footer pt-5">
      <div class="container">
        <div class="row g-4">
          <!-- Brand Info -->
          <div class="col-lg-4 col-md-6">
            <h4 class="footer-title">
              Career<span class="text-warning">Saathi</span>
            </h4>
            <p class="mb-4" style="color: #cccccc;">
              Empowering students to achieve their dreams through expert
              guidance and personalized career counseling.
            </p>
          </div>

          <!-- Quick Links -->
          <div class="col-lg-2 col-md-6">
            <h5 class="footer-title">Quick Links</h5>
            <ul class="list-unstyled">
              <li><a href="#home" class="footer-link">Home</a></li>
              <li><a href="about.html" class="footer-link">About Us</a></li>
              <li><a href="whatwedo.html" class="footer-link">What We Do</a></li>
              <li><a href="#resources" class="footer-link">Resources</a></li>
            </ul>
          </div>

          <!-- Legal -->
          <div class="col-lg-3 col-md-6">
            <h5 class="footer-title">Legal</h5>
            <ul class="list-unstyled">
              <li><a href="#" class="footer-link">Privacy Policy</a></li>
              <li><a href="#" class="footer-link">Terms & Conditions</a></li>
              <li><a href="#" class="footer-link">Cookie Policy</a></li>
            </ul>
          </div>

          <!-- Newsletter (Optional/Simple) -->
          <div class="col-lg-3 col-md-6">
            <h5 class="footer-title">Stay Updated</h5>
            <p class="small" style="color: #cccccc;">
              Subscribe to get latest career tips and updates.
            </p>
            <div class="d-flex gap-2">
              <input
                type="text"
                class="form-control"
                placeholder="Email Address"
              />
              <button class="btn btn-warning" type="button">
                <i class="bi bi-send-fill"></i>
              </button>
            </div>
          </div>
        </div>
      </div>

      <!-- Copyright -->
      <div class="footer-bottom text-center">
        <div class="container">
          <div class="row align-items-center">
            <div class="col-md-12">
              <p class="mb-0">&copy; 2026 CareerSaathi. All rights reserved.</p>
            </div>
          </div>
        </div>
      </div>
    </footer>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <!-- Custom JS -->
    <script src="/js/script.js"></script>

  </body>
</html>