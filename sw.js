// PoseAI service worker — CỐ Ý không cache gì.
// Chỉ tồn tại để trình duyệt cho phép "cài app" (PWA). Mọi request đi thẳng
// ra mạng như bình thường, nên dashboard luôn lấy dữ liệu MỚI từ Supabase,
// tránh hẳn lỗi bản cũ bị kẹt trong cache.
self.addEventListener('install', () => self.skipWaiting());
self.addEventListener('activate', (e) => e.waitUntil(self.clients.claim()));
self.addEventListener('fetch', () => { /* pass-through: không can thiệp */ });
