Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id ABBC025E6DC
	for <lists+cocci@lfdr.de>; Sat,  5 Sep 2020 11:54:20 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0859rwHV017562;
	Sat, 5 Sep 2020 11:53:58 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 5EAA577BC;
	Sat,  5 Sep 2020 11:53:58 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 365BE6717
 for <cocci@systeme.lip6.fr>; Sat,  5 Sep 2020 11:53:56 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0859rt8g022688
 for <cocci@systeme.lip6.fr>; Sat, 5 Sep 2020 11:53:55 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.76,359,1592863200"; d="scan'208";a="466202000"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 05 Sep 2020 11:53:55 +0200
Date: Sat, 5 Sep 2020 11:53:55 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <26349832-57a8-4c6e-efc9-0febd5650922@web.de>
Message-ID: <alpine.DEB.2.22.394.2009051153300.2363@hadrien>
References: <ed9a8046-4c21-e849-f68b-9e08991b701d@web.de>
 <8e76e81f-970b-b1f7-840d-10506dc3311a@linux.com>
 <alpine.DEB.2.22.394.2008151229540.2446@hadrien>
 <34004dc6-e7a6-7557-4c64-2ec74872baea@web.de>
 <alpine.DEB.2.22.394.2008170941280.2526@hadrien>
 <f8103248-4cbe-4c79-cdbf-d2fd758c83a4@web.de>
 <alpine.DEB.2.22.394.2008171001320.2526@hadrien>
 <cad4141c-8cba-3705-a502-0620ae3df027@web.de>
 <alpine.DEB.2.22.394.2008171023300.2526@hadrien>
 <1e60d36d-7f2b-98eb-5fe3-9729b97ba360@web.de>
 <alpine.DEB.2.22.394.2008171829080.2416@hadrien>
 <afbbc6f1-ca60-e780-0139-d944165e456f@web.de>
 <alpine.DEB.2.22.394.2009050937480.2363@hadrien>
 <26349832-57a8-4c6e-efc9-0febd5650922@web.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-2005601436-1599299635=:2363"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 05 Sep 2020 11:53:59 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sat, 05 Sep 2020 11:53:55 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] coccinelle: api: add sprintf() support to
	device_attr_show
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

--8323329-2005601436-1599299635=:2363
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Sat, 5 Sep 2020, Markus Elfring wrote:

> > The clarification will be continued when you provide a small semantic
> > patch and a C file that causes a problem.
>
> I imagine that a patch review was still running.
>
>
> > I'm not going to hunt in years
>
> This action is not needed here.
>
>
> > of mail archives to find it.
>
> Have you got ongoing difficulties with safe issue tracking?
>
> Please use the information also from available archive interfaces.
> https://lore.kernel.org/cocci/0a9015b6-9037-59c5-31f2-cd2b32c86b50@linux.com/
> https://systeme.lip6.fr/pipermail/cocci/2020-August/008120.html
>
>
> > If you want something to happen you have to provide that information now.
>
> Would you like to test the software any further with the attached SmPL script variant
> (and the previously mentioned Linux source file “drivers/base/core.c” for example)?

That is a big file.  What part of it is of concern?

julia
--8323329-2005601436-1599299635=:2363
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-2005601436-1599299635=:2363--
