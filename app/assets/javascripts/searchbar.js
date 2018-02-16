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


  function filterContent() {
    let search_term = navsearchbar.value.toLowerCase();
    let model = navdropdownfield.value.toLowerCase();

    allContent.then((content) => {
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

        const filterPost = (query, post) => (post.title.toLowerCase().includes(query)
          || post.body.toLowerCase().includes(query));
        const filteredPosts = posts.filter((post) => filterPost(search_term, post));

        // const filterMedium = (query, medium) => (medium.title.toLowerCase().includes(query)
        //   || medium.description.toLowerCase().includes(query));
        // const filteredMedia = media.filter((medium) => filterMedium(search_term, medium));
        // console.log('media', filteredMedia);

        const filterImage = (query, image) => (image.title.toLowerCase().includes(query)
          || image.description.toLowerCase().includes(query));
        const filteredImages = images.filter((image) => filterImage(search_term, image));

        const filterAudio = (query, audio) => (audio.title.toLowerCase().includes(query)
          || audio.description.toLowerCase().includes(query));
        const filteredAudios = audios.filter((audio) => filterAudio(search_term, audio));

        const filterVideo = (query, video) => (video.title.toLowerCase().includes(query)
          || video.description.toLowerCase().includes(query));
        const filteredVideos = videos.filter((video) => filterVideo(search_term, video));

        const filterTag = (query, tag) => (tag.name.toLowerCase().includes(query));
        const filteredTags = tags.filter((tag) => filterTag(search_term, tag));

        $(".yield.container").html(`<h3>Search Results</h3>`);

        function displayContent(key, content) {
          if (content.length > 0) {
            $(".yield.container").append(`<b>${key[0].toUpperCase()+key.slice(1)}</b> (${content.length} found)<br />`);
            if (key === 'images' || key === 'audios' || key === 'videos') {
              path = 'media'
            } else {
              path = key
            }
            for (let i=0; i<content.length; i++) {
              $(".yield.container").append(`
                <a href="/${path}/${content[i].id}">
                ${content[i].title || content[i].name || content[i].first_name+' '+content[i].last_name}
              </a><br />`);
            }
          } else {
            $(".yield.container").append(`<i>No ${key} found.</i><br />`);
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
