Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FE1A1FD658
	for <lists+cocci@lfdr.de>; Wed, 17 Jun 2020 22:47:05 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 05HKkl3h022255;
	Wed, 17 Jun 2020 22:46:47 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 72D5E781F;
	Wed, 17 Jun 2020 22:46:47 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 22A3F3D0F
 for <cocci@systeme.lip6.fr>; Wed, 17 Jun 2020 22:46:46 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 05HKkjkc017441
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Wed, 17 Jun 2020 22:46:45 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.73,523,1583190000"; d="scan'208";a="351906452"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Jun 2020 22:46:14 +0200
Date: Wed, 17 Jun 2020 22:46:13 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Denis Efremov <efremov@linux.com>
In-Reply-To: <871aeea8-9b61-5eaa-4b0d-a377ba82c2d0@linux.com>
Message-ID: <alpine.DEB.2.22.394.2006172246010.3083@hadrien>
References: <20200615130242.11825-1-efremov@linux.com>
 <alpine.DEB.2.22.394.2006172225570.3083@hadrien>
 <871aeea8-9b61-5eaa-4b0d-a377ba82c2d0@linux.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 17 Jun 2020 22:46:47 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 17 Jun 2020 22:46:45 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: linux-kernel@vger.kernel.org, cocci@systeme.lip6.fr
Subject: Re: [Cocci] [PATCH] coccinelle: api: add device_attr_show script
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



On Wed, 17 Jun 2020, Denis Efremov wrote:

>
>
> On 6/17/20 11:27 PM, Julia Lawall wrote:
> >
> >
> > On Mon, 15 Jun 2020, Denis Efremov wrote:
> >
> >> According to the documentation[1] show() methods of device attributes
> >> should return the number of bytes printed into the buffer. This is
> >> the return value of scnprintf(). show() must not use snprintf()
> >> when formatting the value to be returned to user space. snprintf()
> >> returns the length the resulting string would be, assuming it all
> >> fit into the destination array[2]. scnprintf() return the length of
> >> the string actually created in buf. If one can guarantee that an
> >> overflow will never happen sprintf() can be used otherwise scnprintf().
> >
> > The semantic patch looks fine.  Do you have any accepted patches from
> > this?
>
> It's not my patches, but:
>
> 3f9f8daad342 cpuidle: sysfs: Fix the overlap for showing available governors
> 117e2cb3eeee sparc: use scnprintf() in show_pciobppath_attr() in vio.c
> 03a1b56f501e sparc: use scnprintf() in show_pciobppath_attr() in pci.c
> 3dee04262898 iio: tsl2772: Use scnprintf() for avoiding potential buffer overflow
> dbdd24eaac4e edd: Use scnprintf() for avoiding potential buffer overflow
> abdd9feb45ed btrfs: sysfs: Use scnprintf() instead of snprintf()
> f21431f2de33 thermal: int340x_thermal: Use scnprintf() for avoiding potential buffer overflow
> 40501c70e3f0 s390/zcrypt: replace snprintf/sprintf with scnprintf
> eb3e064b8dd1 s390/zcrypt: Use scnprintf() for avoiding potential buffer overflow
> 06b522d6de9d video: uvesafb: Use scnprintf() for avoiding potential buffer overflow
> bf1b615ad97e video: omapfb: Use scnprintf() for avoiding potential buffer overflow
> b40e288bfb53 platform/x86: sony-laptop: Use scnprintf() for avoiding potential buffer overflow
> ef21e1750158 ALSA: Use scnprintf() instead of snprintf() for show

Thanks.

julia

>
> and many more
>
> Thanks,
> Denis
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
