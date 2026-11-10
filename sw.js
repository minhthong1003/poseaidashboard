/* Service worker tối giản — chỉ để trình duyệt coi trang là có thể "Cài đặt ứng dụng" (PWA).
   Không cache gì cả: mọi yêu cầu đều đi thẳng ra mạng như bình thường, tránh làm hỏng
   dữ liệu Supabase (vốn cần luôn mới) hoặc gây khó chịu khi cache giữ lại bản HTML cũ. */
self.addEventListener('install', () => { self.skipWaiting(); });
self.addEventListener('activate', (e) => { e.waitUntil(self.clients.claim()); });
self.addEventListener('fetch', () => {});
