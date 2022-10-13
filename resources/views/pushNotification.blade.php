
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Push Notification</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    </head>
    <body>

        <br><br><br>
        <div class="container">
            @if (session('success'))
                <div class="alert alert-success">
                    {{ session('success') }}
                </div>
            @endif

            <h1 class="mb-3">Test Push Notification To Firebase!</h1>
            <form action="{{ route('notification') }}" method="post">
                @csrf
                <div class="mb-3">
                    <label for="title" class="form-label">Notification Title <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="title" placeholder="Notification Title" name="title" value="{{ old('title') }}">
                </div>

                <div class="mb-3">
                    <label for="body" class="form-label">Notification Body <span class="text-danger">*</span></label>
                    <input type="text" class="form-control" id="body" name="body" placeholder="Notification Body" value="{{ old('body') }}">
                </div>

                <div class="mb-3">
                    <button type="submit" class="btn btn-success">Send Notification</button>
                </div>
            </form>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/axios/dist/axios.min.js"></script>
        <script src="https://www.gstatic.com/firebasejs/8.3.2/firebase-app.js"></script>
        <script src="https://www.gstatic.com/firebasejs/8.3.2/firebase-messaging.js"></script>



<script>
    // Your web app's Firebase configuration

    const firebaseConfig = {
        apiKey: "AIzaSyCHhfGgX5SHPdaNri-Me1JU7ZiRt1V72iw",
        authDomain: "alafasymobile-3ca5c.firebaseapp.com",
        databaseURL: "https://alafasymobile-3ca5c-default-rtdb.firebaseio.com",
        projectId: "alafasymobile-3ca5c",
        storageBucket: "alafasymobile-3ca5c.appspot.com",
        messagingSenderId: "441076840806",
        appId: "1:441076840806:web:245c6745a3ff5366a7b0a7",
        measurementId: "G-HNER2PT0PN"
      };



    // Initialize Firebase
    firebase.initializeApp(firebaseConfig);

    const messaging = firebase.messaging();

    function initFirebaseMessagingRegistration() {
        messaging.requestPermission().then(function () {
            return messaging.getToken()
        }).then(function(token) {

            axios.post("{{ route('fcmToken') }}",{
                _method:"PATCH",
                token
            }).then(({data})=>{
                console.log(data)
            }).catch(({response:{data}})=>{
                console.error(data)
            })

        }).catch(function (err) {
            console.log(`Token Error :: ${err}`);
        });
    }

    initFirebaseMessagingRegistration();

    messaging.onMessage(function({data:{body,title}}){
        new Notification(title, {body});
    });
</script>

    </body>
</html>








