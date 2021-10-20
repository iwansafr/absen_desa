const video = document.getElementById('videoInput')
const status = document.getElementById('status')

Promise.all([
    faceapi.nets.faceRecognitionNet.loadFromUri(_URL+'assets/models'),
    faceapi.nets.faceLandmark68Net.loadFromUri(_URL+'assets/models'),
    faceapi.nets.ssdMobilenetv1.loadFromUri(_URL+'assets/models') //heavier/accurate version of tiny face detector
]).then(start,()=>{
    console.log('gagal load library')
})

function start() {
    // navigator.getUserMedia = navigator.getUserMedia ||
    //                      navigator.webkitGetUserMedia ||
    //                      navigator.mozGetUserMedia;

    // if (navigator.getUserMedia) {
    //    navigator.getUserMedia({ audio: true, video: { width: 1280, height: 720 } },
    //       function(stream) {
    //          video.srcObject = stream;
    //          video.onloadedmetadata = function(e) {
    //            // video.play();
    //          };
    //       },
    //       function(err) {
    //          console.log("The following error occurred: " + err.name);
    //       }
    //    );
    // } else {
    //    console.log("getUserMedia not supported");
    // }

    // navigator.mediaDevices.getUserMedia(
    //     { video: {} },
    //     stream => video.srcObject = stream,
    //     err => alert('kamera tidak ditemukan')
    // )

    //video.src = '../videos/speech.mp4'
    if (navigator.mediaDevices.getUserMedia) {
      navigator.mediaDevices.getUserMedia({ video: true })
        .then(function (stream) {
          video.srcObject = stream;
        })
        .catch(function (err0r) {
            alert('camera not found');
          console.log("Camera not detected!");
        });
    }
    console.log('Camera Ready')
    recognizeFaces()
}

async function recognizeFaces() {

    const labeledDescriptors = await loadLabeledImages()
    // console.log(labeledDescriptors)
    const faceMatcher = new faceapi.FaceMatcher(labeledDescriptors, 0.4)
    // console.log(faceMatcher)

    // video.play()
    console.log('Playing')
    status.innerHTML = 'Kamera Ready'

    const canvas = faceapi.createCanvasFromMedia(video)
    document.body.append(canvas)

    const displaySize = { width: video.width, height: video.height }
    faceapi.matchDimensions(canvas, displaySize)

    setInterval(async () => {
        const detections = await faceapi.detectAllFaces(video).withFaceLandmarks().withFaceDescriptors()

        const resizedDetections = faceapi.resizeResults(detections, displaySize)

        canvas.getContext('2d').clearRect(0, 0, canvas.width, canvas.height)

        const results = resizedDetections.map((d) => {
            return faceMatcher.findBestMatch(d.descriptor)
        })
        results.forEach((result, i) => {
            const box = resizedDetections[i].detection.box
            let person = result.toString()
            if (person.match('unknown')) {
                person = 'Bukan karyawan'
            }else{
                const get_text = person
                const regex = new RegExp(/(\d+)(?=\s*-)/);
                const anggota_id = regex.exec(get_text)
                console.log('redirect '+i)
                window.location.href = _URL+'admin/absensi/save/'+anggota_id[0];
                // setInterval(async () => {
                // }, 500)
            }

            // if (result.toString() != 'unknown') {
            //     person = 'karyawan ' + result.toString()
            // }
            const drawBox = new faceapi.draw.DrawBox(box, { label: person })
            drawBox.draw(canvas)
        })
    }, 100)
    
}

function karyawanApi(){
    const api = axios.get(_URL+'admin/absensi/get_karyawan')
    return api
}

async function loadLabeledImages() {
    // const labels = ['Black Widow', 'Captain America', 'Hawkeye', 'Jim Rhodes', 'Tony Stark', 'Thor', 'Captain Marvel', 'iwan', 'lina']
    // const labels = ['iwan'] // for WebCam
    const api = await karyawanApi()
    const labels = api.data
    return Promise.all(
        labels.map(async (label) => {
            console.log(_URL+`images/modules/karyawan/${label.id}/${label.photo}`)
            const descriptions = []
            for (let i = 1; i <= 2; i++) {
                const img = await faceapi.fetchImage(_URL+`images/modules/karyawan/${label.id}/${label.photo}`)
                const detections = await faceapi.detectSingleFace(img).withFaceLandmarks().withFaceDescriptor()
                // console.log(label + i + JSON.stringify(detections))
                descriptions.push(detections.descriptor)
            }
            // document.body.append(label + ' Faces Loaded | ')
            return new faceapi.LabeledFaceDescriptors(label.id+'-'+label.nama, descriptions)
        })
    )
}
// video.addEventListener('play', async () => {
//     console.log('Playing')
//     const canvas = faceapi.createCanvasFromMedia(video)
//     document.body.append(canvas)

//     const displaySize = { width: video.width, height: video.height }
//     faceapi.matchDimensions(canvas, displaySize)

//     setInterval(async () => {
//         const detections = await faceapi.detectAllFaces(video).withFaceLandmarks().withFaceDescriptors()

//         const resizedDetections = faceapi.resizeResults(detections, displaySize)

//         canvas.getContext('2d').clearRect(0, 0, canvas.width, canvas.height)

//         const results = resizedDetections.map((d) => {
//             return faceMatcher.findBestMatch(d.descriptor)
//         })
//         results.forEach((result, i) => {
//             const box = resizedDetections[i].detection.box
//             let person = result.toString()
//             if (person.match('unknown')) {
//                 person = 'Bukan karyawan'
//             }else{
//                 const get_text = person
//                 const regex = new RegExp(/(\d+)(?=\s*-)/);
//                 const anggota_id = regex.exec(get_text)
//                 console.log('redirect '+i)
//                 window.location.href = _URL+'admin/absensi/save/'+anggota_id[0];
//                 // setInterval(async () => {
//                 // }, 500)
//             }

//             // if (result.toString() != 'unknown') {
//             //     person = 'karyawan ' + result.toString()
//             // }
//             const drawBox = new faceapi.draw.DrawBox(box, { label: person })
//             drawBox.draw(canvas)
//         })
//     }, 100)

// })
function startTime() {
  const today = new Date();
  let h = today.getHours();
  let m = today.getMinutes();
  let s = today.getSeconds();
  m = checkTime(m);
  s = checkTime(s);
  document.getElementById('txt').innerHTML =  h + ":" + m + ":" + s;
  setTimeout(startTime, 1000);
}

function checkTime(i) {
  if (i < 10) {i = "0" + i};  // add zero in front of numbers < 10
  return i;
}
startTime()