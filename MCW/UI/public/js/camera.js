
let recorder;
let isRecording = false;
let isPaused = false;

document.getElementById('startButton1').addEventListener('click', function() {
    const cameraFeedUrl = 'http://user:Qaiser1234@192.168.0.90/mjpg/video.mjpg';
    console.log('Recording Started');

    recorder = RecordRTC(cameraFeedUrl, {
        type: 'video'
    });

    recorder.startRecording();
    isRecording = true;
    isPaused = false;
    this.disabled = true; // Disable start button
    document.getElementById('stopButton1').disabled = false; // Enable stop button
    document.getElementById('pauseButton1').disabled = false; // Enable pause button
    
});

document.getElementById('stopButton1').addEventListener('click', function() {
    recorder.stopRecording(function() {
        const blob = recorder.getBlob();
        const url = URL.createObjectURL(blob);

        const a = document.createElement('a');
        a.style.display = 'block';
        a.href = url;
        a.download = 'recorded-video.webm';
        a.innerText = 'Download Recorded Video';
        document.body.appendChild(a);
    });

    isRecording = false;
    isPaused = false;
    this.disabled = true; // Disable stop button
    document.getElementById('startButton1').disabled = false; // Enable start button
    document.getElementById('pauseButton1').disabled = true; // Disable pause button
});

document.getElementById('pauseButton1').addEventListener('click', function() {
    if (isRecording) {
        if (isPaused) {
            recorder.resumeRecording();
            this.innerText = 'Pause Recording'; // Change button text
        } else {
            recorder.pauseRecording();
            this.innerText = 'Resume Recording'; // Change button text
        }
        isPaused = !isPaused;
    }
});