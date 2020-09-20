typedef struct StreamingParams {
  char *muxer_opt_key;
  char *muxer_opt_value;
  char *video_codec;
  char *audio_codec;
} StreamingParams;

typedef struct StreamingContext {
  AVFormatContext *avfc;
  AVCodec *video_avc;
  AVCodec *audio_avc;
  AVStream *video_avs;
  AVStream *audio_avs;
  AVCodecContext *video_avcc;
  AVCodecContext *audio_avcc;
  int video_index;
  int audio_index;
  char *filename;
} StreamingContext;
