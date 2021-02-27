Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E205326C75
	for <lists+cocci@lfdr.de>; Sat, 27 Feb 2021 10:15:14 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 11R9Ekua024838;
	Sat, 27 Feb 2021 10:14:46 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 844C677DE;
	Sat, 27 Feb 2021 10:14:46 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 2662F3E64
 for <cocci@systeme.lip6.fr>; Sat, 27 Feb 2021 10:14:44 +0100 (CET)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 11R9Eh8T009739
 for <cocci@systeme.lip6.fr>; Sat, 27 Feb 2021 10:14:43 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.81,210,1610406000"; d="scan'208";a="374262337"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Feb 2021 10:14:20 +0100
Date: Sat, 27 Feb 2021 10:14:20 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Denis Efremov <yefremov.denis@gmail.com>
In-Reply-To: <47b8a2cd-ff8a-ac8c-a9b1-015488bbc959@gmail.com>
Message-ID: <alpine.DEB.2.22.394.2102271013190.2926@hadrien>
References: <alpine.DEB.2.22.394.2102270905410.2926@hadrien>
 <47b8a2cd-ff8a-ac8c-a9b1-015488bbc959@gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 27 Feb 2021 10:14:48 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sat, 27 Feb 2021 10:14:43 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] release of version 1.1.0
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



On Sat, 27 Feb 2021, Denis Efremov wrote:

> Hi,
>
> Great news!
>
> Could you please create release tag on GitHub?
> This will allow me to add this version to tests and add new opam package version.
> Currently, I use these versions for tests:
> https://github.com/evdenis/cvehound/blob/master/.github/workflows/test.yml#L25

There is no tag at the moment.  I have asked why.

>
> BTW, is there 1.0.9 version? I see that fedora provides 1.0.9 version,
> but there is not release tag for it and there is no opam package for it.

No, there is no version 1.0.9.  We moved on to 1.1 due to the #spatch
feature.

julia

> Thanks,
> Denis
>
> On 2/27/21 11:11 AM, Julia Lawall wrote:
> > A new version 1.1.0 has been released.  The most interesting change is the
> > ability to put spatch command line options in a .cocci file, for example:
> >
> > #spatch --very-quiet -j 8 --recursive-includes --include-headers-for-types
> >
> > Other specific improvements are an improved handling of attributes and a
> > more efficient treatment of header files (all thanks to Jaskaran Singh).
> >
> > Various other small issues have been addressed.
> >
> > All of these changes have already been available on github.
> >
> > julia
> > _______________________________________________
> > Cocci mailing list
> > Cocci@systeme.lip6.fr
> > https://systeme.lip6.fr/mailman/listinfo/cocci
> >
> _______________________________________________
> Cocci mailing list
> Cocci@systeme.lip6.fr
> https://systeme.lip6.fr/mailman/listinfo/cocci
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
