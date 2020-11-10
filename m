Return-Path: <cocci-bounces@systeme.lip6.fr>
X-Original-To: lists+cocci@lfdr.de
Delivered-To: lists+cocci@lfdr.de
Received: from isis.lip6.fr (isis.lip6.fr [IPv6:2001:660:3302:283c::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FAF42ADD17
	for <lists+cocci@lfdr.de>; Tue, 10 Nov 2020 18:38:19 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [132.227.104.7])
	by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0AAHbsRM003710;
	Tue, 10 Nov 2020 18:37:54 +0100 (CET)
Received: from systeme.lip6.fr (systeme.lip6.fr [127.0.0.1])
	by systeme.lip6.fr (Postfix) with ESMTP id E63C4779B;
	Tue, 10 Nov 2020 18:37:53 +0100 (CET)
X-Original-To: cocci@systeme.lip6.fr
Delivered-To: cocci@systeme.lip6.fr
Received: from isis.lip6.fr (isis.lip6.fr [132.227.60.2])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by systeme.lip6.fr (Postfix) with ESMTPS id 59666454B
 for <cocci@systeme.lip6.fr>; Tue, 10 Nov 2020 18:37:51 +0100 (CET)
Received: from mail2-relais-roc.national.inria.fr
 (mail2-relais-roc.national.inria.fr [192.134.164.83])
 by isis.lip6.fr (8.15.2/8.15.2) with ESMTP id 0AAHbpj1019690
 for <cocci@systeme.lip6.fr>; Tue, 10 Nov 2020 18:37:51 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.77,466,1596492000"; d="scan'208";a="476881115"
Received: from 173.121.68.85.rev.sfr.net (HELO hadrien) ([85.68.121.173])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 10 Nov 2020 18:37:50 +0100
Date: Tue, 10 Nov 2020 18:37:50 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: "Richard W.M. Jones" <rjones@redhat.com>
In-Reply-To: <20201110151507.GA25508@redhat.com>
Message-ID: <alpine.DEB.2.22.394.2011101837190.2870@hadrien>
References: <20201110151058.82289-1-rjones@redhat.com>
 <20201110151507.GA25508@redhat.com>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
MIME-Version: 1.0
X-Greylist: Sender IP whitelisted, Sender e-mail whitelisted, not delayed by milter-greylist-4.4.3 (isis.lip6.fr [132.227.60.2]); Tue, 10 Nov 2020 18:37:55 +0100 (CET)
X-Greylist: Sender passed SPF test, not delayed by milter-greylist-4.4.3
 (isis.lip6.fr [132.227.60.2]); Tue, 10 Nov 2020 18:37:51 +0100 (CET)
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
X-Scanned-By: MIMEDefang 2.78 on 132.227.60.2
Cc: cocci@systeme.lip6.fr
Subject: Re: [Cocci] [PATCH Python 10] bundles/pyml: Remove bindings for
 PyObject_As(Char|Read|Write)Buffer
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



On Tue, 10 Nov 2020, Richard W.M. Jones wrote:

> On Tue, Nov 10, 2020 at 03:10:57PM +0000, Richard W.M. Jones wrote:
> > Some more functions were deprecated/removed in Python 10,
> > breaking Coccinelle compiles.  It was reported by Fedora's
> > Python team here:
> >
> > https://bugzilla.redhat.com/show_bug.cgi?id=1896393
> >
> > I have fixed it by chopping out bindings for these
> > functions from the bundled pyml, and it compiles fine
> > for me with Python 10 now.
>
> Erm, Python 3.10, not Python 10 obviously :-)

Thanks for the patch.

julia


>
> Rich.
>
> --
> Richard Jones, Virtualization Group, Red Hat http://people.redhat.com/~rjones
> Read my programming and virtualization blog: http://rwmj.wordpress.com
> virt-df lists disk usage of guests without needing to install any
> software inside the virtual machine.  Supports Linux and Windows.
> http://people.redhat.com/~rjones/virt-df/
>
>
_______________________________________________
Cocci mailing list
Cocci@systeme.lip6.fr
https://systeme.lip6.fr/mailman/listinfo/cocci
