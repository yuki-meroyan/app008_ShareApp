class ImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  # include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  module ActionDispatch
    module Http
      class UploadedFile
        attr_accessor :original_filename, :content_type, :tempfile, :headers
  
        def initialize(hash) #
          @original_filename = encode_filename(hash[:filename]) 
          @content_type      = hash[:type]     #画像の保存形式
          @headers           = hash[:head]       # header 情報
          @tempfile          = hash[:tempfile]  # 画像データのリファレンス?
          raise(ArgumentError, ':tempfile is required') unless @tempfile
        end
  
        def read(*args)
          @tempfile.read(*args)
        end
  
        # Delegate these methods to the tempfile.
        # つまり、tempfileについて、size, path, open, などなどが使えるということ
        [:open, :path, :rewind, :size].each do |method|
          class_eval "def #{method}; @tempfile.#{method}; end"
        end
  
        private
        #画像のファイルネームを取り込む部分
        #強制的にUTF-8に変換
        def encode_filename(filename) 
          # Encode the filename in the utf8 encoding, unless it is nil or we're in 1.8
          if "ruby".encoding_aware? && filename
            filename.force_encoding("UTF-8").encode!
          else
            filename
          end
        end
      end
  
      module Upload
        # Convert nested Hash to HashWithIndifferentAccess and replace
        # file upload hash with UploadedFile objects
        def normalize_parameters(value)
          if Hash === value && value.has_key?(:tempfile)
            UploadedFile.new(value)
          else
            super
          end
        end
        private :normalize_parameters
      end
    end
  end
  # Provide a default URL as a default if there hasn't been a file uploaded:
  # def default_url(*args)
  #   # For Rails 3.1+ asset pipeline compatibility:
  #   # ActionController::Base.helpers.asset_path("fallback/" + [version_name, "default.png"].compact.join('_'))
  #
  #   "/images/fallback/" + [version_name, "default.png"].compact.join('_')
  # end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  # version :thumb do
  #   process resize_to_fit: [50, 50]
  # end

  # Add a white list of extensions which are allowed to be uploaded.
  # For images you might use something like this:
  # def extension_whitelist
  #   %w(jpg jpeg gif png)
  # end

  # Override the filename of the uploaded files:
  # Avoid using model.id or version_name here, see uploader/store.rb for details.
  # def filename
  #   "something.jpg" if original_filename
  # end
end
