Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C0E229049
	for <lists+cocci@lfdr.de>; Wed, 22 Jul 2020 08:03:12 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 06M62gQJ019280;
	Wed, 22 Jul 2020 08:02:42 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 7CE977814;
	Wed, 22 Jul 2020 08:02:42 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id E770C3F6C
 for <cocci@systeme.lip6.fr>; Wed, 22 Jul 2020 08:02:39 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 06M62cpZ007143
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Wed, 22 Jul 2020 08:02:38 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,381,1589234400"; d="scan'208";a="354990745"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 22 Jul 2020 08:02:37 +0200
Date: Wed, 22 Jul 2020 08:02:37 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <0b326e2b-723c-3482-c0ef-5d6592a9c6cb@web.de>
Message-ID: <alpine.DEB.2.22.394.2007220801590.2918@hadrien>
References: <e3d2ffb9-2a47-3d77-0501-9d48845435bd@web.de>
 <alpine.DEB.2.22.394.2007211158310.2487@hadrien>
 <0b326e2b-723c-3482-c0ef-5d6592a9c6cb@web.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-416411769-1595397758=:2918"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Wed, 22 Jul 2020 08:02:44 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Wed, 22 Jul 2020 08:02:38 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Michal Marek <michal.lkml@markovi.net>,
        Gilles Muller <Gilles.Muller@lip6.fr>, kernel-janitors@vger.kernel.org,
        Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org,
        Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] [PATCH v3 2/3] coccinelle: api: extend memdup_user rule
 with vmemdup_user()
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

--8323329-416411769-1595397758=:2918
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Wed, 22 Jul 2020, Markus Elfring wrote:

> >>> +@depends on patch@
> >>> +expression from,to,size;
> >>> +identifier l1,l2;
> >>> +@@
> >>> +
> >>> +-  to = \(kvmalloc\|kvzalloc\)(size,\(GFP_KERNEL\|GFP_USER\));
> >>> ++  to = vmemdup_user(from,size);
> >>
> >> I propose to combine the desired adjustment with the previous SmPL rule
> >> by using another disjunction.
>
> How do you think about to check run time characteristics for
> the following SmPL script sketches?
>
> A)
> @R1@
> @@
> // Change something
>
> @R2@
> @@
> // Change another thing
>
>
> B)
> @Replacement_with_disjunction@
> @@
> (
> // R1: Change something
> |
> // R2: Change another thing
> )

Markus, you are welcome to try this since you are concerned about it.
But it doesn't matter.

julia

>
>
> >>> +@rv depends on !patch@
> >>> +expression from,to,size;
> >>> +position p;
> >>> +statement S1,S2;
> >>> +@@
> >>> +
> >>> +*  to = \(kvmalloc@p\|kvzalloc@p\)(size,\(GFP_KERNEL\|GFP_USER\));
> >>> +   if (to==NULL || ...) S1
> >>> +   if (copy_from_user(to, from, size) != 0)
> >>> +   S2
> >>
> >> * Can it be helpful to omit the SmPL asterisk functionality from
> >>   the operation modes “org” and “report”?
> >>
> >> * Should the operation mode “context” work without an extra position metavariable?
> >
> > This is fine as is in all three aspects.
>
> Is every technique from the Coccinelle software required for
> each operation mode in such data processing approaches?
>
> Regards,
> Markus
>
--8323329-416411769-1595397758=:2918
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-416411769-1595397758=:2918--
