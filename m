Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFDE39C074
	for <lists+cocci@lfdr.de>; Fri,  4 Jun 2021 21:31:37 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 154JVIB1016257;
	Fri, 4 Jun 2021 21:31:18 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id E75F377F5;
	Fri,  4 Jun 2021 21:31:17 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 000323E3B
 for <cocci@systeme.lip6.fr>; Fri,  4 Jun 2021 21:31:15 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 154JVBMY012768
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Fri, 4 Jun 2021 21:31:12 +0200 (CEST)
IronPort-HdrOrdr: =?us-ascii?q?A9a23=3AlVuHaqxSfFr9P/4zTuWGKrPwnL1zdoMgy1kn?=
 =?us-ascii?q?xilNoHtuA6ilfqGV7ZEmPHDP5Ar5NEtOpTniAsS9qBHnhP1ICOAqVN/INjUO01?=
 =?us-ascii?q?HIEGgN1+XfKnHbexHWx6pm/ZpMN4x3CNjLB1B8isrgiTPIauoI8Z282J2EwcPX?=
 =?us-ascii?q?z3JWRwlsbK16qyhjDALzKDwMeCB2QaAQKbfZwsJGogCrcXMRYt/+JlRtZZmkm/?=
 =?us-ascii?q?T70KjPXDNDIxYm7TOFhTSu5KW/Mx+W2AwbWy5Ox7BKyxmjryXJop+Kjtz+7hfd?=
 =?us-ascii?q?0lXY55NQlMCk8MJKAOaMhsIWQw+c8jpBNOxaKt+/VS4O0ZuS1Go=3D?=
X-IronPort-AV: E=Sophos;i="5.83,248,1616454000"; d="scan'208";a="383507633"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Jun 2021 21:31:11 +0200
Date: Fri, 4 Jun 2021 21:31:11 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Jonas Schrottenbaum <jonasschrottenbaum@googlemail.com>
In-Reply-To: <CAPwUoMR6dc0Ovs2DEUicSB2FqT6TkjUDbUoA8z-04Jd4mk_WTw@mail.gmail.com>
Message-ID: <alpine.DEB.2.22.394.2106042128380.14645@hadrien>
References: <CAPwUoMR6dc0Ovs2DEUicSB2FqT6TkjUDbUoA8z-04Jd4mk_WTw@mail.gmail.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1160815624-1622835071=:14645"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 04 Jun 2021 21:31:18 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Fri, 04 Jun 2021 21:31:12 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] No coccicheck target
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
Sender: cocci-bounces@systeme.lip6.fr
Errors-To: cocci-bounces@systeme.lip6.fr

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1160815624-1622835071=:14645
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT



On Fri, 4 Jun 2021, Jonas Schrottenbaum wrote:

> Hello, 
> i'm currently trying to check out coccinelle and already could apply a simple semantic patch to a small C program with the spatch command.
>
> Please excuse me, but i'm quite a beginner in this field.  
>
> I read on this page, about coccicheck and the different modes.
> It says, that i have to run: 
>
> make coccicheck MODE=report
> or
> make coccicheck MODE=patch
>
> in order to switch the mode.

All of this is only for the Linux kernel.  Coccicheck is a target in the
Linux kernel make file.

>
> But where do i have to run this? Is this just for using coccinelle on the linux kernel? Is it not relevant, if i want to use coccinelle for general C programs?

No, it is not relevant for general C programs.

> I thought it is a make target for coccinelle itself, but there is no target called coccicheck defined in the coccinelle makefile, as far as i can tell.
> So if i run it in the same dir as the make install for coccinelle, all i get is:
>
> make: *** no rule to make target coccicheck. stop.
>
> So, am i doing something wrong, or is coccicheck only relevant for linux kernel development?
> It says: "A Coccinelle-specific target is defined in the top level Makefile."
> which Makefile? The linux top level Makefile?

you should run spatch directly for other software.  Here is a document
that describes common usages and the complete set of command line options
(it is a little bit out of date, but everything there should still be
usable).

https://coccinelle.gitlabpages.inria.fr/website/docs/options.pdf

julia
--8323329-1160815624-1622835071=:14645
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-1160815624-1622835071=:14645--
