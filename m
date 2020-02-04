Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 16950151CC0
	for <lists+cocci@lfdr.de>; Tue,  4 Feb 2020 15:59:37 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 014ExL4N028630;
	Tue, 4 Feb 2020 15:59:21 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id C1DDE77E8;
	Tue,  4 Feb 2020 15:59:21 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 5356F77E8
 for <cocci@systeme.lip6.fr>; Tue,  4 Feb 2020 15:59:20 +0100 (CET)
Received: from mail3-relais-sop.national.inria.fr
 (mail3-relais-sop.national.inria.fr [192.134.164.104])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 014ExJNp004305
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Tue, 4 Feb 2020 15:59:19 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.70,402,1574118000"; d="scan'208";a="338035017"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 04 Feb 2020 15:59:19 +0100
Date: Tue, 4 Feb 2020 15:59:19 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: julia@hadrien
To: eamanu <eamanu@yaerobi.com>
In-Reply-To: <786d2ea9-621f-bcc4-b626-aed6454784e2@yaerobi.com>
Message-ID: <alpine.DEB.2.21.2002041556540.3345@hadrien>
References: <786d2ea9-621f-bcc4-b626-aed6454784e2@yaerobi.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 04 Feb 2020 15:59:22 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Tue, 04 Feb 2020 15:59:20 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] coccinelle depends on unmaintained pygtk
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

On Tue, 4 Feb 2020, eamanu wrote:

> Hi everybody,
>
> Sorry if this issues is duplicated, I am new in the mailing list
> and in a very quickly searching I didn't found about this issue.
>
> I am working on Coccinelle package on Debian

Thanks!

> and currently
> exist the next bug [1].
>
> There is any plan to port to use GObject Instrospection?
>
> [1] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=885267

I think we should just drop the code that depends on it.  It was added for
a MS thesis more than 10 years ago, and I don't think anyone has used it
since.

I will look into it.

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
