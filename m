Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 07093234173
	for <lists+cocci@lfdr.de>; Fri, 31 Jul 2020 10:45:28 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 06V8j9Cx026688;
	Fri, 31 Jul 2020 10:45:09 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id CABEB7807;
	Fri, 31 Jul 2020 10:45:09 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 8469F4121
 for <cocci@systeme.lip6.fr>; Fri, 31 Jul 2020 10:45:07 +0200 (CEST)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 06V8j6QD020333
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Fri, 31 Jul 2020 10:45:06 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.75,417,1589234400"; d="scan'208";a="355689191"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 31 Jul 2020 10:45:05 +0200
Date: Fri, 31 Jul 2020 10:45:05 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <96a71d0e-ae6f-9355-b02a-b1a084376f1e@web.de>
Message-ID: <alpine.DEB.2.22.394.2007311044340.2439@hadrien>
References: <75532a99-4498-c64a-de34-c9033782aa9e@web.de>
 <alpine.DEB.2.22.394.2007302125580.2548@hadrien>
 <96a71d0e-ae6f-9355-b02a-b1a084376f1e@web.de>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-701465646-1596185105=:2439"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Fri, 31 Jul 2020 10:45:10 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Fri, 31 Jul 2020 10:45:06 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Michal Marek <michal.lkml@markovi.net>,
        Gilles Muller <Gilles.Muller@lip6.fr>, kernel-janitors@vger.kernel.org,
        Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel@vger.kernel.org,
        Coccinelle <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] [PATCH v4] coccinelle: api: add kvfree script
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

--8323329-701465646-1596185105=:2439
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Fri, 31 Jul 2020, Markus Elfring wrote:

> >>> +msg = "WARNING: kmalloc is used to allocate this memory at line %s" % (k[0].line)
> >>> +coccilib.org.print_todo(p[0], msg)
> >>
> >> * I find the diagnostic text insufficient.
> >
> > I also find the message not very informative.
>
> Is it interesting how quick such views can change?

Yes.  If one looks at something in context, one and understand it better
than the extract that you provided.

julia

> https://lore.kernel.org/cocci/alpine.DEB.2.22.394.2007302214160.2548@hadrien/
> https://systeme.lip6.fr/pipermail/cocci/2020-July/008041.html
> https://lkml.org/lkml/2020/7/30/1015
>
> “…
> Actually, the message looks fine.  Sorry for the noise about that.
> …”
>
>
> Can such notifications become more helpful?
>
> Regards,
> Markus
>
--8323329-701465646-1596185105=:2439
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-701465646-1596185105=:2439--
