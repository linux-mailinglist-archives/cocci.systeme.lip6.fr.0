Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7649487C2E
	for <lists+cocci@lfdr.de>; Fri,  9 Aug 2019 15:56:51 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x79DuMrF022734;
	Fri, 9 Aug 2019 15:56:22 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id D1AFF7797;
	Fri,  9 Aug 2019 15:56:22 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id A9B707788
 for <cocci@systeme.lip6.fr>; Fri,  9 Aug 2019 15:56:21 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id x79DuKLM026536
 for <cocci@systeme.lip6.fr>; Fri, 9 Aug 2019 15:56:20 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.64,364,1559512800"; d="scan'208";a="316021726"
Received: from portablejulia.rsr.lip6.fr ([132.227.76.63])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 09 Aug 2019 15:56:19 +0200
Date: Fri, 9 Aug 2019 15:56:18 +0200 (CEST)
From: Julia Lawall <julia.lawall@lip6.fr>
X-X-Sender: julia@hadrien
To: Alexander Popov <alex.popov@linux.com>
In-Reply-To: <9ced7a06-5048-ad1a-3428-c8f943f7469c@linux.com>
Message-ID: <alpine.DEB.2.21.1908091555090.2946@hadrien>
References: <20190326220348.61172-1-jannh@google.com>
 <9ced7a06-5048-ad1a-3428-c8f943f7469c@linux.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 09 Aug 2019 15:56:24 +0200 (CEST)
X-Greylist: IP, sender and recipient auto-whitelisted, not delayed by
 milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]);
 Fri, 09 Aug 2019 15:56:20 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Jens Axboe <axboe@kernel.dk>, Michal Marek <michal.lkml@markovi.net>,
        Jann Horn <jannh@google.com>, Mukesh Ojha <mojha@codeaurora.org>,
        Jiri Kosina <jikos@kernel.org>, Nicolas Palix <nicolas.palix@imag.fr>,
        linux-kernel@vger.kernel.org, Denis Efremov <efremov@linux.com>,
        linux-block@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
        "kernel-hardening@lists.openwall.com" <kernel-hardening@lists.openwall.com>,
        cocci@systeme.lip6.fr
Subject: Re: [Cocci] [PATCH] floppy: fix usercopy direction
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



On Fri, 9 Aug 2019, Alexander Popov wrote:

> Hello everyone!
>
> On 27.03.2019 1:03, Jann Horn wrote:
> > As sparse points out, these two copy_from_user() should actually be
> > copy_to_user().
>
> I've spent some time on these bugs, but it turned out that they are already public.
>
> I think Jann's patch is lost, it is not applied to the mainline.
> So I add a new floppy maintainer Denis Efremov to CC.
>
> These bugs on x86_64 cause memset for the userspace memory from the kernelspace.
> That is funny:
>  - access_ok for the copy_from_user source (2nd argument) returns zero;
>  - copy_from_user tries to erase the destination (1st argument);
>  - but the destination is in the userspace instead of kernelspace.
>
> So we have:
> [   40.937098] BUG: unable to handle page fault for address: 0000000041414242
> [   40.938714] #PF: supervisor write access in kernel mode
> [   40.939951] #PF: error_code(0x0002) - not-present page
> [   40.941121] PGD 7963f067 P4D 7963f067 PUD 0
> [   40.942107] Oops: 0002 [#1] SMP NOPTI
> [   40.942968] CPU: 0 PID: 292 Comm: d Not tainted 5.3.0-rc3+ #7
> [   40.944288] Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS
> Ubuntu-1.8.2-1ubuntu1 04/01/2014
> [   40.946478] RIP: 0010:__memset+0x24/0x30
> [   40.947394] Code: 90 90 90 90 90 90 0f 1f 44 00 00 49 89 f9 48 89 d1 83 e2 07
> 48 c1 e9 03 40 0f b6 f6 48 b8 01 01 01 01 01 01 01 01 48 0f af c6 <f3> 48 ab 89
> d1 f3 aa 4c 89 c8 c3 90 49 89 f9 40 88 f0 48 89 d1 f3
> [   40.951721] RSP: 0018:ffffc900003dbd58 EFLAGS: 00010206
> [   40.952941] RAX: 0000000000000000 RBX: 0000000000000034 RCX: 0000000000000006
> [   40.954592] RDX: 0000000000000004 RSI: 0000000000000000 RDI: 0000000041414242
> [   40.956169] RBP: 0000000041414242 R08: ffffffff8200bd80 R09: 0000000041414242
> [   40.957753] R10: 0000000000121806 R11: ffff88807da28ab0 R12: ffffc900003dbd7c
> [   40.959407] R13: 0000000000000001 R14: 0000000041414242 R15: 0000000041414242
> [   40.961062] FS:  00007f91115c4440(0000) GS:ffff88807da00000(0000)
> knlGS:0000000000000000
> [   40.962603] CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> [   40.963695] CR2: 0000000041414242 CR3: 000000007c584000 CR4: 00000000000006f0
> [   40.965004] Call Trace:
> [   40.965459]  _copy_from_user+0x51/0x60
> [   40.966141]  compat_getdrvstat+0x124/0x170
> [   40.966781]  fd_compat_ioctl+0x69c/0x6d0
> [   40.967423]  ? selinux_file_ioctl+0x16f/0x210
> [   40.968117]  compat_blkdev_ioctl+0x21d/0x8f0
> [   40.968864]  __x32_compat_sys_ioctl+0x99/0x250
> [   40.969659]  do_syscall_64+0x4a/0x110
> [   40.970337]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
>
>
> I haven't found a way to exploit it.
>
> > Fixes: 229b53c9bf4e ("take floppy compat ioctls to sodding floppy.c")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Jann Horn <jannh@google.com>
> > Reviewed-by: Mukesh Ojha <mojha@codeaurora.org>
> > ---
> > compile-tested only
>
> Acked-by: Alexander Popov <alex.popov@linux.com>
>
> >  drivers/block/floppy.c | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/block/floppy.c b/drivers/block/floppy.c
> > index 95f608d1a098..8c641245ff12 100644
> > --- a/drivers/block/floppy.c
> > +++ b/drivers/block/floppy.c
> > @@ -3749,7 +3749,7 @@ static int compat_getdrvprm(int drive,
> >  	v.native_format = UDP->native_format;
> >  	mutex_unlock(&floppy_mutex);
> >
> > -	if (copy_from_user(arg, &v, sizeof(struct compat_floppy_drive_params)))
> > +	if (copy_to_user(arg, &v, sizeof(struct compat_floppy_drive_params)))
> >  		return -EFAULT;
> >  	return 0;
> >  }
> > @@ -3785,7 +3785,7 @@ static int compat_getdrvstat(int drive, bool poll,
> >  	v.bufblocks = UDRS->bufblocks;
> >  	mutex_unlock(&floppy_mutex);
> >
> > -	if (copy_from_user(arg, &v, sizeof(struct compat_floppy_drive_struct)))
> > +	if (copy_to_user(arg, &v, sizeof(struct compat_floppy_drive_struct)))
> >  		return -EFAULT;
> >  	return 0;
> >  Eintr:
> >
>
> I also wrote a coccinelle rule for detecting similar bugs (adding coccinelle
> experts to CC).
>
>
> virtual report
>
> @cfu@

You can replace the above line with @cfu exists@.  You want to find the
existence of such a call, not ensure that the call occurs on every
control-flow path, which is the default.

Do you want this rule to go into the kernel?

julia

> identifier f;
> type t;
> identifier v;
> position decl_p;
> position copy_p;
> @@
>
> f(..., t v@decl_p, ...)
> {
> <+...
> copy_from_user@copy_p(v, ...)
> ...+>
> }
>
> @script:python@
> f << cfu.f;
> t << cfu.t;
> v << cfu.v;
> decl_p << cfu.decl_p;
> copy_p << cfu.copy_p;
> @@
>
> if '__user' in t:
>   msg0 = "function \"" + f + "\" has arg \"" + v + "\" of type \"" + t + "\""
>   coccilib.report.print_report(decl_p[0], msg0)
>   msg1 = "copy_from_user uses \"" + v + "\" as the destination. What a shame!\n"
>   coccilib.report.print_report(copy_p[0], msg1)
>
>
> The rule output:
>
> ./drivers/block/floppy.c:3756:49-52: function "compat_getdrvprm" has arg "arg"
> of type "struct compat_floppy_drive_params __user *"
> ./drivers/block/floppy.c:3783:5-19: copy_from_user uses "arg" as the
> destination. What a shame!
>
> ./drivers/block/floppy.c:3789:49-52: function "compat_getdrvstat" has arg "arg"
> of type "struct compat_floppy_drive_struct __user *"
> ./drivers/block/floppy.c:3819:5-19: copy_from_user uses "arg" as the
> destination. What a shame!
>
>
> Best regards,
> Alexander
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
