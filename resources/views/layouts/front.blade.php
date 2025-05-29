<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Yadanarbonnewspaper</title>
  <link rel="stylesheet" href="{{asset('front-assets/bootstrap/css/bootstrap.min.css')}}">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
  <link rel="stylesheet" href="{{asset('front-assets/style.css')}}">
  <script src="{{asset('front-assets/bootstrap/js/bootstrap.bundle.min.js')}}"></script>
</head>
<body class="bg-color-cover">
    <nav class="d-flex justify-content-center align-item-center  bg-color-nav sticky-top shadow">
      <img src="{{asset('front-assets/images/OnlineLogonews.jpg')}}" class="img-fluid img-thumbnail my-1 float-start" width="250" height="50"  alt="logoimage">
      
      <!-- <h1 class="py-4 fw-bolder">Yadanarbon Newspaper</h1> -->
      <!-- <div class="bold-line p-0 m-0 shadow"></div> -->
      
      <!-- @guest
      @if (Route::has('login'))
          <li class="nav-item">
              <a class="nav-link" href="{{ route('login') }}">{{ __('Login') }}</a>
          </li>
      @endif

      @if (Route::has('register'))
          <li class="nav-item">
              <a class="nav-link" href="{{ route('register') }}">{{ __('Register') }}</a>
          </li>
      @endif
      @else
      <li class="nav-item dropdown">
          <a id="navbarDropdown" class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false" v-pre>
              {{ Auth::user()->name }}
          </a>
          
          <div class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
              @if(Auth::user()->role_id == '1')
                <a class="dropdown-item" href="/backend">
                  Admin Panel
                </a>                
              @else
                <a class="dropdown-item" href="">
                  Profile
                </a>
                
              @endif
              <a class="dropdown-item" href="{{ route('logout') }}"
                  onclick="event.preventDefault();
                                document.getElementById('logout-form').submit();">
                  {{ __('Logout') }}
              </a>

              <form id="logout-form" action="{{ route('logout') }}" method="POST" class="d-none">
                  @csrf
              </form>
          </div>
      </li>
      @endguest -->
    </nav>
    
    

    <!-- pdf list -->
    <div class="container my-3 content-wrapper">
        @yield('content')
    </div>
    

  <footer class="bg-dark py-4 mt-3 shadow">
    <span class="text-white ps-5">© 1992 Yadanarbon Newspaper</span>    
  </footer>
  <a href="#" class="back-to-top" title="Back to top">&#8679;</a>
</body>
</html>
