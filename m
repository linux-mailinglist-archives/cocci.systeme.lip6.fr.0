Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 07A11143C88
	for <lists+cocci@lfdr.de>; Tue, 21 Jan 2020 13:05:55 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 00LC5TN2029659;
	Tue, 21 Jan 2020 13:05:29 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id 036C077F4;
	Tue, 21 Jan 2020 13:05:29 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 330B677E1
 for <cocci@systeme.lip6.fr>; Tue, 21 Jan 2020 13:05:27 +0100 (CET)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 00LC5LLE024789
 for <cocci@systeme.lip6.fr>; Tue, 21 Jan 2020 13:05:21 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,345,1574118000"; d="scan'208";a="336532550"
Received: from 77-108-166-118.brightstar.limited (HELO hadrien)
 ([77.108.166.118])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 21 Jan 2020 13:05:02 +0100
Date: Tue, 21 Jan 2020 12:05:01 +0000 (GMT)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: julia@hadrien
To: Jaskaran Singh <jaskaransingh7654321@gmail.com>
In-Reply-To: <7bb4650f42c2d5b25d5695bf6f9f257bc5407043.camel@gmail.com>
Message-ID: <alpine.DEB.2.21.2001211204450.2277@hadrien>
References: <5bb2b304-96d9-c3e0-af31-5e918f1a8e40@web.de>
 <7bb4650f42c2d5b25d5695bf6f9f257bc5407043.camel@gmail.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 21 Jan 2020 13:05:29 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Tue, 21 Jan 2020 13:05:21 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: "linux-kernel-mentees@lists.linuxfoundation.org"
 <linux-kernel-mentees@lists.linuxfoundation.org>,
        Markus Elfring <Markus.Elfring@web.de>,
        "cocci@systeme.lip6.fr" <cocci@systeme.lip6.fr>
Subject: Re: [Cocci] [PATCH v2 2/3] parsing_hacks: Add bool to list of known
 typedefs
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



On Tue, 21 Jan 2020, Jaskaran Singh wrote:

> On Tue, 2020-01-21 at 11:10 +0100, Markus Elfring wrote:
> > > Before:
> > >   passed:bool
> >
> > I wonder if subsequent duplicate information can really help to
> > achieve a better understanding
> > by the suggested description of a software situation.
> >
>
> Hm, I thought it would but you're probably right. Should I just remove
> the second Before/After? The text above it about trace_kprobe.c
> explains things anyway.

I find it helpful as is.

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
