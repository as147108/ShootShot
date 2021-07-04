
maxLen = 100; // 字數頂限

function checkMaxInput(form) {
if (form.message.value.length > maxLen) // if too long.... trim it!
form.message.value = form.message.value.substring(0, maxLen);
// otherwise, update 'characters left' counter
else form.remLen.value = maxLen - form.message.value.length;
}
