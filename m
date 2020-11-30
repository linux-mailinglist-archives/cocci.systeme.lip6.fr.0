Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E48B2C8E96
	for <lists+cocci@lfdr.de>; Mon, 30 Nov 2020 21:00:49 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0AUJxjQs015831;
	Mon, 30 Nov 2020 20:59:45 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 1D26A77CD;
	Mon, 30 Nov 2020 20:59:45 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id B7480620
 for <cocci@systeme.lip6.fr>; Mon, 30 Nov 2020 20:59:43 +0100 (CET)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0AUJxgIH024990
 for <cocci@systeme.lip6.fr>; Mon, 30 Nov 2020 20:59:42 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.78,382,1599516000"; 
 d="scan'208,217";a="366117668"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 30 Nov 2020 20:59:42 +0100
Date: Mon, 30 Nov 2020 20:59:42 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Ira Weiny <ira.weiny@intel.com>
In-Reply-To: <20201130191904.GQ1161629@iweiny-DESK2.sc.intel.com>
Message-ID: <alpine.DEB.2.22.394.2011302051210.2758@hadrien>
References: <20201128054145.GP1161629@iweiny-DESK2.sc.intel.com>
 <alpine.DEB.2.22.394.2011280849310.2725@hadrien>
 <20201130191904.GQ1161629@iweiny-DESK2.sc.intel.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 30 Nov 2020 20:59:45 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Mon, 30 Nov 2020 20:59:42 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] Itterating matches
X-BeenThere: cocci@systeme.lip6.fr
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: <cocci.systeme.lip6.fr>
List-Unsubscribe: <https://systeme.lip6.fr/mailman/options/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=unsubscribe>
List-Archive: <https://systeme.lip6.fr/pipermail/cocci>
List-Post: <mailto:cocci@systeme.lip6.fr>
List-Help: <mailto:cocci-request@systeme.lip6.fr?subject=help>
List-Subscribe: <https://systeme.lip6.fr/mailman/listinfo/cocci>,
 <mailto:cocci-request@systeme.lip6.fr?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

> That said it does not seem to work.  I have a better example now.
>
> https://elixir.bootlin.com/linux/v5.10-rc6/source/fs/btrfs/compression.c
>
> fs/btrfs/compression.c:
>
>  571                 if (page->index == end_index) {
>  572                         char *userpage;
>  573                         size_t zero_offset = offset_in_page(isize);
>  574
>  575                         if (zero_offset) {
>  576                                 int zeros;
>  577                                 zeros = PAGE_SIZE - zero_offset;
>  578                                 userpage = kmap_atomic(page);
>  579                                 memset(userpage + zero_offset, 0, zeros);
>  580                                 flush_dcache_page(page);
>  581                                 kunmap_atomic(userpage);
>  582                         }
>  583                 }
>
> <script>
> @ r1 @
> identifier page;
> identifier ptr;
> expression L;
> expression Off;
> @@
>
> -ptr = kmap_atomic(page);
> ...
> -memset(ptr + Off, 0, L);
> +zero_user(page, Off, L);
> ...
> -kunmap_atomic(ptr);
>
>
> @@
> identifier r1.ptr;
> type VP;
> @@
>
> -VP ptr;
>         ... when != ptr;
> </script>
>
> Results in:
>
> --- fs/btrfs/compression.c
> +++ /tmp/cocci-output-1442863-cb5dd7-compression.c
> @@ -575,10 +575,8 @@ static noinline int add_ra_bio_pages(str
>                         if (zero_offset) {
>                                 int zeros;
>                                 zeros = PAGE_SIZE - zero_offset;
> -                               userpage = kmap_atomic(page);
> -                               memset(userpage + zero_offset, 0, zeros);
> +                               zero_user(page, zero_offset, zeros);
>                                 flush_dcache_page(page);
> -                               kunmap_atomic(userpage);
>                         }
>                 }
>
>
> Question: Is there something about userpage being declared in the outer block
> which is causing the second rule to fail?

The problem is the while loop. The ... when != ptr goes to the end of the
function.  It thus goes around the loop and reaches the use of userpage
again.  You can do:

type VP, VP1;

- VP ptr;
  ... when != ptr;
? VP1 ptr;

Then it will check that there is no use of ptr until reaching a new
declaration of ptr, if any (the ? ).

>
>
> Back to the 'iteration issue'.  I've realized that I understood perfectly what
> the iteration dot notations meant...  My bug was elsewhere.
>
> For others who may be following along at home, I'll walk through this because
> it brings up another issue with the removal of the pointer declaration which
> I don't understand.
>
> That same file (fs/btrfs/compression.c) has a second instance I'm trying to
> match; except with memcpy().
>
> 1242         char *kaddr;
> ...
> 1267         /* copy bytes from the working buffer into the pages */
> 1268         while (working_bytes > 0) {
> 1269                 bytes = min_t(unsigned long, bvec.bv_len,
> 1270                                 PAGE_SIZE - (buf_offset % PAGE_SIZE));
> 1271                 bytes = min(bytes, working_bytes);
> 1272
> 1273                 kaddr = kmap_atomic(bvec.bv_page);
> 1274                 memcpy(kaddr + bvec.bv_offset, buf + buf_offset, bytes);
> 1275                 kunmap_atomic(kaddr);
> ...
>
>
> Here I added <... ...> (and even tried <+... ...+>) around the
> k[un]map_atomic() in my script to try and catch the second instance along with
> the memcpy() as an alternative match; thusly.
>
> <script>
> @ r1 @
> identifier page;
> identifier ptr;
> expression L;
> expression F;
> expression B;
> expression Off;
> @@
>
> <...
> -ptr = kmap_atomic(page);
> ...
> (
> -memset(ptr + Off, 0, L);
> +zero_user(page, Off, L);
> |
> -memcpy(ptr + Off, F, B);
> +memcpy_to_page(page, Off, F, B);
> )
> ...
> -kunmap_atomic(ptr);
> ...>

I don't see the need for the outer <... ...>.  It looks like the pattern
inside the <... ...> should already match lines 1273-1275 in the code.


>
> @@
> identifier r1.ptr;
> type VP;
> @@
>
> -VP ptr;
>         ... when != ptr;
> </script>
>
> Which results in:
>
> --- fs/btrfs/compression.c
> +++ /tmp/cocci-output-1443266-8381d0-compression.c
> @@ -575,10 +575,8 @@ static noinline int add_ra_bio_pages(str
>                         if (zero_offset) {
>                                 int zeros;
>                                 zeros = PAGE_SIZE - zero_offset;
> -                               userpage = kmap_atomic(page);
> -                               memset(userpage + zero_offset, 0, zeros);
> +                               zero_user(page, zero_offset, zeros);
>                                 flush_dcache_page(page);
> -                               kunmap_atomic(userpage);
>                         }
>                 }
>
> :-/
>
> Finally, after thinking on this more I realized this was _not_ because the
> _iteration_ was wrong.  Rather the second kmap_atomic uses 'bvec.bv_page' which
> matches as an expression not an identifier.  The correct script is therefore:
>
> <script>
> 10:59:30 > cat kmap-test.cocci
> @ r1 @
> expression page;                <============ 'expression'
> identifier ptr;
> expression L;
> expression F;
> expression B;
> expression Off;
> @@
>
> -ptr = kmap_atomic(page);
> ...
> (
> -memset(ptr + Off, 0, L);
> +zero_user(page, Off, L);
> |
> -memcpy(ptr + Off, F, B);
> +memcpy_to_page(page, Off, F, B);
> )
> ...
> -kunmap_atomic(ptr);
>
>
> @@
> identifier r1.ptr;
> type VP;
> @@
>
> -VP ptr;
>         ... when != ptr;
> </script>
>
> which results in...
>
> --- fs/btrfs/compression.c
> +++ /tmp/cocci-output-1443375-182695-compression.c
> @@ -145,7 +145,6 @@ static int check_compressed_csum(struct
>         const u16 csum_size = btrfs_super_csum_size(fs_info->super_copy);
>         struct page *page;
>         unsigned long i;
> -       char *kaddr;
>         u8 csum[BTRFS_CSUM_SIZE];
>         struct compressed_bio *cb = bio->bi_private;
>         u8 *cb_sum = cb->sums;
> @@ -575,10 +574,8 @@ static noinline int add_ra_bio_pages(str
>                         if (zero_offset) {
>                                 int zeros;
>                                 zeros = PAGE_SIZE - zero_offset;
> -                               userpage = kmap_atomic(page);
> -                               memset(userpage + zero_offset, 0, zeros);
> +                               zero_user(page, zero_offset, zeros);
>                                 flush_dcache_page(page);
> -                               kunmap_atomic(userpage);
>                         }
>                 }
>
> @@ -1239,7 +1236,6 @@ int btrfs_decompress_buf2page(const char
>         unsigned long prev_start_byte;
>         unsigned long working_bytes = total_out - buf_start;
>         unsigned long bytes;
> -       char *kaddr;
>         struct bio_vec bvec = bio_iter_iovec(bio, bio->bi_iter);
>
>         /*
> @@ -1270,9 +1266,8 @@ int btrfs_decompress_buf2page(const char
>                                 PAGE_SIZE - (buf_offset % PAGE_SIZE));
>                 bytes = min(bytes, working_bytes);
>
> -               kaddr = kmap_atomic(bvec.bv_page);
> -               memcpy(kaddr + bvec.bv_offset, buf + buf_offset, bytes);
> -               kunmap_atomic(kaddr);
> +               memcpy_to_page(bvec.bv_page, bvec.bv_offset, buf + buf_offset,
> +                              bytes);
>                 flush_dcache_page(bvec.bv_page);
>
>                 buf_offset += bytes;
>
>
> Yay!!!  The 'iteration' is not even needed...  :-D  So sorry for bothering you
> on that point.
>
> However, I still have an issue with the second rule you specified.  It appears
> to be too aggressive with removing kaddr; removing it from an entirely
> unrelated function.  Why?  Is there a way to limit the scope of the second rule
> to blocks and parent blocks?

Indeed the rule does nothing to check that the function is the same.  I
kind of assumed that good code would not contain unused variables, and if
the code does contain unused variables you would be happy to be rid of
them.  However, it is possible with some scripting hacks to find the name
of the function that one rule matches and then use that information to
filter the matches of another rule.  But again, I'm not sure it is worth
the trouble.

julia


>
> And the final questoin is: Why is kaddr correctly removed from
> btrfs_decompress_buf2page() while the previous match 'userpage' is not?  It
> seems like exactly the same pattern...
>
> So obviously don't fully understand.
>
> Thanks so much for your help though!  :-D
> Ira
>
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
