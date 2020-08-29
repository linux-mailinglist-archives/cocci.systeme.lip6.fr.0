Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FA372569E9
	for <lists+cocci@lfdr.de>; Sat, 29 Aug 2020 21:49:00 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 07TJmECU020421;
	Sat, 29 Aug 2020 21:48:14 +0200 (CEST)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id C8E2A3F6C;
	Sat, 29 Aug 2020 21:48:14 +0200 (CEST)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id D95023F6C
 for <cocci@systeme.lip6.fr>; Sat, 29 Aug 2020 21:48:12 +0200 (CEST)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTPS id 07TJmCN3014329
 (version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <cocci@systeme.lip6.fr>; Sat, 29 Aug 2020 21:48:12 +0200 (CEST)
X-IronPort-AV: E=Sophos;i="5.76,359,1592863200"; d="scan'208";a="465221526"
Received: from abo-173-121-68.mrs.modulonet.fr (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 29 Aug 2020 21:48:12 +0200
Date: Sat, 29 Aug 2020 21:48:11 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Joe Perches <joe@perches.com>
In-Reply-To: <489164b541e344f254b70429e4f6d467e1602931.camel@perches.com>
Message-ID: <alpine.DEB.2.22.394.2008292146170.3629@hadrien>
References: <20200811210127.11889-1-efremov@linux.com>
 <alpine.DEB.2.22.394.2008292133360.3629@hadrien>
 <489164b541e344f254b70429e4f6d467e1602931.camel@perches.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Sat, 29 Aug 2020 21:48:15 +0200 (CEST)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Sat, 29 Aug 2020 21:48:12 +0200 (CEST)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: Kees Cook <keescook@chromium.org>,
        "Gustavo A . R . Silva" <gustavoars@kernel.org>, cocci@systeme.lip6.fr,
        linux-kernel@vger.kernel.org
Subject: Re: [Cocci] [RFC PATCH] coccinelle: misc: add
 uninitialized_var.cocci script
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



On Sat, 29 Aug 2020, Joe Perches wrote:

> On Sat, 2020-08-29 at 21:36 +0200, Julia Lawall wrote:
> >
> > On Wed, 12 Aug 2020, Denis Efremov wrote:
> >
> > > Commit 63a0895d960a ("compiler: Remove uninitialized_var() macro") and
> > > commit 4b19bec97c88 ("docs: deprecated.rst: Add uninitialized_var()")
> > > removed uninitialized_var() and deprecated it.
> > >
> > > The purpose of this script is to prevent new occurrences of open-coded
> > > variants of uninitialized_var().
>
> > > Cc: Kees Cook <keescook@chromium.org>
> > > Cc: Gustavo A. R. Silva <gustavoars@kernel.org>
> > > Signed-off-by: Denis Efremov <efremov@linux.com>
> >
> > Applied, without the commented out part.
> >
> > I only got three warnings, though.  Perhaps the others have been fixed?
>
> uninitialized_var does not exist in -next

OK, if it seems better, I can remove it.  Out of the threee reported, one
was a completely unnecessary initialization.

julia
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
