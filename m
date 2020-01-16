Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 1763213D871
	for <lists+cocci@lfdr.de>; Thu, 16 Jan 2020 12:00:00 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 00GAxbY1027708;
	Thu, 16 Jan 2020 11:59:37 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id BFEA277F7;
	Thu, 16 Jan 2020 11:59:37 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id EC167771F
 for <cocci@systeme.lip6.fr>; Thu, 16 Jan 2020 11:59:35 +0100 (CET)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 00GAxUSB017006
 for <cocci@systeme.lip6.fr>; Thu, 16 Jan 2020 11:59:30 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,326,1574118000"; d="scan'208";a="336027035"
Received: from roc044r.vpn.inria.fr ([128.93.183.44])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 16 Jan 2020 11:59:29 +0100
Date: Thu, 16 Jan 2020 11:59:29 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: julia@hadrien
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
In-Reply-To: <61e7b9f2d132e6bc9feb13ae8fc4636cd934f0b2.camel@gmail.com>
Message-ID: <alpine.DEB.2.21.2001161158440.3888@hadrien>
References: <1090dc9b-9556-f6ab-23dc-f7d0a8176220@web.de>
 <61e7b9f2d132e6bc9feb13ae8fc4636cd934f0b2.camel@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1957031417-1579172369=:3888"
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Thu, 16 Jan 2020 11:59:37 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Thu, 16 Jan 2020 11:59:30 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
        Markus Elfring <Markus.Elfring@web.de>,
        "cocci@systeme.lip6.fr" <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] [PATCH] parsing_c: Add space for tokens after *
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

--8323329-1957031417-1579172369=:3888
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT



On Thu, 16 Jan 2020, Jaskaran Singh wrote:

> On Thu, 2020-01-16 at 11:40 +0100, Markus Elfring wrote:
> > > In certain cases, there is no space added after the Pointer type.
> >
> > Will such a pretty-printing detail matter also for the clarification
> > of
> > a topic like “Make change influence configurable for coding style
> > rules”?
> > https://github.com/coccinelle/coccinelle/issues/37
> >
>
> Not sure what you mean. If you mean to say that the result should
> conform to the Linux coding style (i.e. the result should be "const
> char * const * y" with spaces et al intact), that seems like something
> for a different patch, right? Whether you want Coccinelle to conform to
> Linux coding style or not, the space should be added either way.


The option --smpl-spacing should address this issue, by preservign the
spacing illustrated in the semantic patch.  I don't know if it does that
in this case.

julia

>
> Cheers,
> Jaskaran.
>
> > Regards,
> > Markus
>
> _______________________________________________
> Cocci mailing list
> Cocci@systeme.lip6.fr
> https://systeme.lip6.fr/mailman/listinfo/cocci
>
--8323329-1957031417-1579172369=:3888
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci

--8323329-1957031417-1579172369=:3888--
