// Reloading page... not what I wanted
// document.addEventListener("DOMContentLoaded", () => {
//   navsearchbar = document.querySelector('.navsearchbar');
//   navdropdownfield = document.querySelector('.navdropdownfield');
//   // let search_term = navsearchbar.value;
//   // let model = navdropdownfield.value;
//   navdropdownfield.addEventListener("change", e => {
//
//   });
  // navsearchbar.addEventListener("keyup", e => {
  //   search_term = e.currentTarget.value;
  //   // getContent(model, search_term);
  //   debugger;
  //   _.debounce(getContent, 300)
  // });
//   function getContent() {
//     let search_term = navsearchbar.value;
//     let model = navdropdownfield.value;
//     window.location.href=`/contents`;
//     // window.location.href = `/contents?model_name=${model}&search_term=${search_term}`;
//   }
//
//   $('.navsearchbar').on('keyup', _.debounce(
//     getContent, 300
//   ))
// });

// Load using jQuery
document.addEventListener("DOMContentLoaded", () => {
  navsearchbar = document.querySelector('.navsearchbar');
  navdropdownfield = document.querySelector('.navdropdownfield');
  function getContent() {
    return fetch(`/contents/api`,
    {
      method: 'GET'
    }
  )
    .then(res => res.json())
  }

  $('.navsearchbar').on('keyup', _.debounce(
    filterContent, 200
  ));

  $('.navdropdownfield').on('change', _.debounce(
    filterContent, 200
  ));

  let allContent = getContent();
  allContent.then(content => console.log(content));

  function filterContent() {
    // console.log('filterContent')
    let search_term = navsearchbar.value.toLowerCase();
    let model = navdropdownfield.value.toLowerCase();

    allContent.then((content) => {
      // console.log('content', content)
        let {
          posts,
          // media,
          images,
          videos,
          audios,
          users,
          tags
        } = content;

        const filterUser = (query, user) => (user.first_name.toLowerCase().includes(query)
          || user.last_name.toLowerCase().includes(query));
        const filteredUsers = users.filter((user) => filterUser(search_term, user));
        // console.log('users', filteredUsers);

        const filterPost = (query, post) => (post.title.toLowerCase().includes(query)
          || post.body.toLowerCase().includes(query));
        const filteredPosts = posts.filter((post) => filterPost(search_term, post));
        // console.log('posts', filteredPosts);

        // const filterMedium = (query, medium) => (medium.title.toLowerCase().includes(query)
        //   || medium.description.toLowerCase().includes(query));
        // const filteredMedia = media.filter((medium) => filterMedium(search_term, medium));
        // console.log('media', filteredMedia);

        const filterImage = (query, image) => (image.title.toLowerCase().includes(query)
          || image.description.toLowerCase().includes(query));
        const filteredImages = images.filter((image) => filterImage(search_term, image));
        // console.log('images', filteredImages);

        const filterAudio = (query, audio) => (audio.title.toLowerCase().includes(query)
          || audio.description.toLowerCase().includes(query));
        const filteredAudios = audios.filter((audio) => filterAudio(search_term, audio));
        // console.log('audios', filteredAudios);

        const filterVideo = (query, video) => (video.title.toLowerCase().includes(query)
          || video.description.toLowerCase().includes(query));
        const filteredVideos = videos.filter((video) => filterVideo(search_term, video));
        // console.log('videos', filteredVideos);

        const filterTag = (query, tag) => (tag.name.toLowerCase().includes(query));
        const filteredTags = tags.filter((tag) => filterTag(search_term, tag));
        // console.log('tags', filteredTags);

        $(".yield.container").html(`<h3>Search Results</h3>`);

        function displayContent(key, content) {
          $(".yield.container").append(`<b>${key[0].toUpperCase()+key.slice(1)}</b> (${content.length} found)<br />`);
          for (let i=0; i<content.length; i++) {
            $(".yield.container").append(`
              <a href="/${key}/${content[i].id}">
                ${content[i].title || content[i].name || content[i].first_name+' '+content[i].last_name}
              </a><br />`);
          }
        }

        switch (model) {
          case 'posts':
            displayContent(model, filteredPosts);
            break;
          case 'media':
            displayContent('images', filteredImages);
            displayContent('audios', filteredAudios);
            displayContent('videos', filteredVideos);
            break;
          case 'images':
            displayContent(model, filteredImages);
            break;
          case 'audios':
            displayContent(model, filteredAudios);
            break;
          case 'videos':
            displayContent(model, filteredVideos);
            break;
          case 'users':
            displayContent(model, filteredUsers);
            break;
          case 'tags':
            displayContent(model, filteredTags);
            break;
          default:
            displayContent('posts', filteredPosts);
            displayContent('images', filteredImages);
            displayContent('audios', filteredAudios);
            displayContent('videos', filteredVideos);
            displayContent('users', filteredUsers);
            displayContent('tags', filteredTags);
            break;
        }

    })

  }

});
