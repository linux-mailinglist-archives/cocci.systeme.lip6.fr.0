Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F3C245FBB
	for <lists+cocci@lfdr.de>; Mon, 17 Aug 2020 10:25:08 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 07H8Olgp017541;
	Mon, 17 Aug 2020 10:24:47 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 2397277BC;
	Mon, 17 Aug 2020 10:24:47 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 7F69F428B
 for <cocci@systeme.lip6.fr>; Mon, 17 Aug 2020 10:24:45 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 07H8OiBv028198
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Mon, 17 Aug 2020 10:24:45 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.76,322,1592863200"; d="scan'208";a="356671963"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 17 Aug 2020 10:24:44 +0200
Date: Mon, 17 Aug 2020 10:24:44 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <cad4141c-8cba-3705-a502-0620ae3df027@web.de>
Message-ID: <alpine.DEB.2.22.394.2008171023300.2526@hadrien>
References: <ed9a8046-4c21-e849-f68b-9e08991b701d@web.de>
 <8e76e81f-970b-b1f7-840d-10506dc3311a@linux.com>
 <alpine.DEB.2.22.394.2008151229540.2446@hadrien>
 <34004dc6-e7a6-7557-4c64-2ec74872baea@web.de>
 <alpine.DEB.2.22.394.2008170941280.2526@hadrien>
 <f8103248-4cbe-4c79-cdbf-d2fd758c83a4@web.de>
 <alpine.DEB.2.22.394.2008171001320.2526@hadrien>
 <cad4141c-8cba-3705-a502-0620ae3df027@web.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1406414646-1597652684=:2526"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Mon, 17 Aug 2020 10:24:47 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Mon, 17 Aug 2020 10:24:45 +0200 (CEST)
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

--8323329-1406414646-1597652684=:2526
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Mon, 17 Aug 2020, Markus Elfring wrote:

> >> Can missing source code matches trigger the consequence that questionable
> >> branches would be applied there?
> >
> > No.
>
> I imagine that corresponding views will need further clarifications.

What clarifications?  In the failing_andany example the problem is that
less code is transformed than should be.  So no "quationable branches" are
applied.

julia

>
>
> > The problem causes transformations that should be applied not to be applied.
>
> I reported errors according to the software category “failing tests - TODO”.
> Thus I am still looking for solutions in affected application areas.
>
> Regards,
> Markus
>
--8323329-1406414646-1597652684=:2526
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-1406414646-1597652684=:2526--
