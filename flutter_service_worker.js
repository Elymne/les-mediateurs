'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"manifest.json": "a86e0ad4db6651e65b43c05ea3bc8482",
"flutter.js": "7d69e653079438abfbb24b82a655b0a4",
"version.json": "1fc7ead3d66df19f35d58ef4b03bea5b",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"index.html": "e209e22d6ae77176022d0b360521294e",
"/": "e209e22d6ae77176022d0b360521294e",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"assets/FontManifest.json": "9957a1c26c6101e2fcaa130a01ea89f9",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/packages/youtube_player_iframe/assets/player.html": "dc7a0426386dc6fd0e4187079900aea8",
"assets/NOTICES": "533967749eb53763fde1f27f4a7a2877",
"assets/AssetManifest.json": "35598bcd6e7441a3c742604b67a41ca0",
"assets/AssetManifest.bin.json": "df10b2fdd9b60c5902a7df9a81d9dc45",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"assets/assets/svg/instagram_icon.svg": "d0cca5d905e5ac505ed6dc5ec6b40989",
"assets/assets/svg/youtube_icon.svg": "7ec6b8cab3a36de7b62269683fb44ef9",
"assets/assets/svg/facebook_icon.svg": "2009a1c75056e24ed0a8430e8e0233a2",
"assets/assets/svg/twitter_icon.svg": "aa62a94150d2b3d7319242b2af3cdddc",
"assets/assets/images/facebook.png": "5d86834861e6b470100e08d57e3a8674",
"assets/assets/images/instagram_icon.png": "e5ca3e585152fec64306866b85971fc5",
"assets/assets/images/background.png": "87546171f983c827bd8354b0ad53f963",
"assets/assets/images/twitter.png": "c3e5f05135e9e894eb2794589f60a7ae",
"assets/assets/images/youtube_icon.png": "338a4d0aa4b56dd36f0ee4b61940a2f9",
"assets/assets/fonts/raleway/italic/Raleway-BlackItalic.ttf": "6bb69e40367ae9814db8c80152eed900",
"assets/assets/fonts/raleway/italic/Raleway-BoldItalic.ttf": "17cc8fb94a06e0808b3a1e93a5ddee28",
"assets/assets/fonts/raleway/italic/Raleway-MediumItalic.ttf": "5aeca04536968ff9f32afc0bcd61eb60",
"assets/assets/fonts/raleway/italic/Raleway-Italic.ttf": "5579b5fda3005b7d349336b3425b9f89",
"assets/assets/fonts/raleway/italic/Raleway-ThinItalic.ttf": "73456336793992177ea8a337ccaa6950",
"assets/assets/fonts/raleway/italic/Raleway-SemiBoldItalic.ttf": "5890daae80f0d711900058b808f819ec",
"assets/assets/fonts/raleway/italic/Raleway-ExtraBoldItalic.ttf": "33da5d431479287ebc94ecd1a9d1d039",
"assets/assets/fonts/raleway/italic/Raleway-ExtraLightItalic.ttf": "7ef38cb3e0f9b6aa829cc7c9b90a615d",
"assets/assets/fonts/raleway/italic/Raleway-LightItalic.ttf": "bd42d0599d807527617bb3f5ed8df31b",
"assets/assets/fonts/raleway/normal/Raleway-ExtraBold.ttf": "1d8b73517fb37be5cf23cd3843ad4eb2",
"assets/assets/fonts/raleway/normal/Raleway-Medium.ttf": "0c8c5471e4a8bfe0f6167f56bcf1e2d3",
"assets/assets/fonts/raleway/normal/Raleway-Thin.ttf": "02cf7464c6ce00474e8d90b69f103d75",
"assets/assets/fonts/raleway/normal/Raleway-ExtraLight.ttf": "39de59bc225416348683ae039df2a1f9",
"assets/assets/fonts/raleway/normal/Raleway-SemiBold.ttf": "804eb7bc11d3a38d5f5e108f8d1d1acd",
"assets/assets/fonts/raleway/normal/Raleway-Black.ttf": "ca057783cb90d483d16662f202212050",
"assets/assets/fonts/raleway/normal/Raleway-Regular.ttf": "d95649da7dfb965a289ac29105ce8771",
"assets/assets/fonts/raleway/normal/Raleway-Bold.ttf": "21c82294041b1504a5cbe4f566c8acd6",
"assets/assets/fonts/raleway/normal/Raleway-Light.ttf": "a36750fa9f5530b0c2760267df04ae37",
"assets/AssetManifest.bin": "32059b2016944e1fd341a69c70706088",
"assets/fonts/MaterialIcons-Regular.otf": "b187881c3bd5389c732e74665b05ac68",
"canvaskit/skwasm.wasm": "4124c42a73efa7eb886d3400a1ed7a06",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/canvaskit.wasm": "64edb91684bdb3b879812ba2e48dd487",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/chromium/canvaskit.wasm": "f87e541501c96012c252942b6b75d1ea",
"main.dart.js": "d0d425612dbd9e262e0758a3198d86b6"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
