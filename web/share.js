function shareText(text) {
    if (navigator.share) {
        navigator.share({
            text: text
        }).then(() => {
            console.log('Thanks for sharing!');
        }).catch(console.error);
    } else {
        console.error('Share not supported on this browser, do it the old way.');
        // Fallback for older browsers
        prompt("Copy this text and share it:", text);
    }
}
