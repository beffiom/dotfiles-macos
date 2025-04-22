class Ext4fuse < Formula
  desc "FUSE driver for ext4 file system"
  homepage "https://github.com/gerard/ext4fuse"
  url "https://github.com/gerard/ext4fuse.git", tag: "v20230107"
  version "20230107"
  license "GPL-2.0-or-later"

  depends_on "autoconf" => :build
  depends_on "automake" => :build
  depends_on "libtool" => :build
  depends_on "pkg-config" => :build
  depends_on "osxfuse"

  def install
    system "./autogen.sh"
    system "./configure", "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install"
  end

  def caveats
    <<~EOS
      ext4fuse requires root privileges to mount. You can allow this by adding the following line to /etc/fstab:

      <device> <mount_point> fuse.ext4fuse allow_other,defer_permissions

      Or, to allow only the current user to mount:

      <device> <mount_point> fuse.ext4fuse allow_other,defer_permissions,user=#{ENV['USER']}
    EOS
  end

  test do
    system "true"
  end
end
